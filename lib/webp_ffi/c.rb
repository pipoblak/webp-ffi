module WebpFfi
  module C
    # enum
    vp8_status_code_enum = enum(:vp8_status_ok, 0,
      :vp8_status_out_of_memory,
      :vp8_status_invalid_params,
      :vp8_status_bitstream_error,
      :vp8_status_unsupported_feature,
      :vp8_status_suspended,
      :vp8_status_user_abort,
      :vp8_status_not_enought_data)
    # struct
    class WebPBitstreamFeatures < FFI::Struct
      layout  :width, :int,
        :height, :int,
        :has_alpha, :int
    end
    
    # webp lib functions
    attach_function :decoder_version, [], :string
    attach_function :encoder_version, [], :string
    
    attach_function :WebPGetInfo, [:pointer, :size_t, :pointer, :pointer], :int
    
    attach_function :WebPDecodeRGBA, [:pointer, :size_t, :pointer, :pointer], :pointer

    attach_function :test, [:int], :int
  end
end
