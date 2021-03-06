#!/usr/bin/env python2
# -*- coding: utf-8 -*-
##################################################
# GNU Radio Python Flow Graph
# Title: Fhss Rx
# Generated: Mon Jul 18 23:00:35 2016
##################################################
from sys import argv
from gnuradio import blocks
from gnuradio import eng_notation
from gnuradio import filter
from gnuradio import gr
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from optparse import OptionParser
import Spread


class FHSS_rx(gr.top_block):

    def __init__(self):
        gr.top_block.__init__(self, "Fhss Rx")

        ##################################################
        # Variables
        ##################################################
        self.samp_sym = samp_sym = 12000*3
        self.transistion = transistion = 50
        self.tone_freq = tone_freq = 0
        self.sideband_rx = sideband_rx = 6000
        self.sideband = sideband = 6000
        self.samp_rate = samp_rate = 12000
        self.interpolation = interpolation = 4
        self.init = init = 1, 1, 1, 1
        self.generator = generator = 1, 1, 0, 0, 1
        self.code_rate = code_rate = int(samp_sym * 1)
        self.carrier = carrier = 10000

        ##################################################
        # Blocks
        ##################################################
        self.rational_resampler_xxx_1_0 = filter.rational_resampler_ccc(
                interpolation=1,
                decimation=interpolation,
                taps=None,
                fractional_bw=None,
        )
        self.freq_xlating_fir_filter_xxx_0_0_0 = filter.freq_xlating_fir_filter_ccc(1, (filter.firdes.low_pass(1, samp_rate*4, carrier+sideband_rx,1000)), carrier, samp_rate*4)

        script, inputwav, outputBinary= argv
        self.blocks_wavfile_source_0_1 = blocks.wavfile_source(inputwav, False)
        self.blocks_throttle_1_0 = blocks.throttle(gr.sizeof_gr_complex*1, samp_rate,True)
        self.blocks_throttle_0_0 = blocks.throttle(gr.sizeof_gr_complex*1, samp_rate,True)
        self.blocks_float_to_complex_0_0 = blocks.float_to_complex(1)
        self.blocks_file_sink_0_0 = blocks.file_sink(gr.sizeof_char*1, outputBinary, False)
        self.blocks_file_sink_0_0.set_unbuffered(False)
        self.Spread_rx_synthesizer_0_0 = Spread.rx_synthesizer(code_rate, 
                                      samp_sym, 
                                      samp_rate, 
                                      12000/2, 
                                      50000, 
                                      0.16, 
                                      (generator), 
                                      (init))
        self.Spread_cpfsk_demod_0_0 = Spread.cpfsk_demod(samp_sym)

        ##################################################
        # Connections
        ##################################################
        self.connect((self.Spread_cpfsk_demod_0_0, 0), (self.blocks_file_sink_0_0, 0))    
        self.connect((self.Spread_rx_synthesizer_0_0, 0), (self.blocks_throttle_0_0, 0))    
        self.connect((self.blocks_float_to_complex_0_0, 0), (self.freq_xlating_fir_filter_xxx_0_0_0, 0))    
        self.connect((self.blocks_throttle_0_0, 0), (self.Spread_cpfsk_demod_0_0, 0))    
        self.connect((self.blocks_throttle_1_0, 0), (self.Spread_rx_synthesizer_0_0, 0))    
        self.connect((self.blocks_wavfile_source_0_1, 0), (self.blocks_float_to_complex_0_0, 0))    
        self.connect((self.freq_xlating_fir_filter_xxx_0_0_0, 0), (self.rational_resampler_xxx_1_0, 0))    
        self.connect((self.rational_resampler_xxx_1_0, 0), (self.blocks_throttle_1_0, 0))    

    def get_samp_sym(self):
        return self.samp_sym

    def set_samp_sym(self, samp_sym):
        self.samp_sym = samp_sym
        self.set_code_rate(int(self.samp_sym * 1))

    def get_transistion(self):
        return self.transistion

    def set_transistion(self, transistion):
        self.transistion = transistion

    def get_tone_freq(self):
        return self.tone_freq

    def set_tone_freq(self, tone_freq):
        self.tone_freq = tone_freq

    def get_sideband_rx(self):
        return self.sideband_rx

    def set_sideband_rx(self, sideband_rx):
        self.sideband_rx = sideband_rx
        self.freq_xlating_fir_filter_xxx_0_0_0.set_taps((filter.firdes.low_pass(1, self.samp_rate*4, self.sideband_rx,1000)))

    def get_sideband(self):
        return self.sideband

    def set_sideband(self, sideband):
        self.sideband = sideband

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.blocks_throttle_0_0.set_sample_rate(self.samp_rate)
        self.blocks_throttle_1_0.set_sample_rate(self.samp_rate)
        self.freq_xlating_fir_filter_xxx_0_0_0.set_taps((filter.firdes.low_pass(1, self.samp_rate*4, self.sideband_rx,1000)))

    def get_interpolation(self):
        return self.interpolation

    def set_interpolation(self, interpolation):
        self.interpolation = interpolation

    def get_init(self):
        return self.init

    def set_init(self, init):
        self.init = init

    def get_generator(self):
        return self.generator

    def set_generator(self, generator):
        self.generator = generator

    def get_code_rate(self):
        return self.code_rate

    def set_code_rate(self, code_rate):
        self.code_rate = code_rate

    def get_carrier(self):
        return self.carrier

    def set_carrier(self, carrier):
        self.carrier = carrier
        self.freq_xlating_fir_filter_xxx_0_0_0.set_center_freq(self.carrier)


def main(top_block_cls=FHSS_rx, options=None):

    tb = top_block_cls()
    tb.start()
    tb.wait()


if __name__ == '__main__':
    main()
