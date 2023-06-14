Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0B1EB64D9
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jun 2023 11:55:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244402AbjFNLzx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jun 2023 07:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244404AbjFNLzp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jun 2023 07:55:45 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0721BF3
        for <linux-doc@vger.kernel.org>; Wed, 14 Jun 2023 04:55:36 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f62b552751so8412078e87.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Jun 2023 04:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686743735; x=1689335735;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ykv/GwV2w/s1XOWDjj7UvX/0sKbvp29mJL9R2dK69wc=;
        b=IOwIuW/a1zAfPZaRWrd646FOcfeyRubilQTZrt+HFVhmIYBiDZ4AV1pos3rO2n3or+
         Ls88VyeCX2rUUHKLZDeBMpv4117TCTdvjlA90Kjtp4XC2+gLpkcBIRqMtD8dfPkXI0iw
         AEbh07I264SrfU/dVYkN6nN1liKLNvYBi8acMrRosd4Ekj0yaodPJIVvlGoupeoccd/L
         qTbs/reSnSG5eZP7qT6BwCKoxsJjupzk7eMIjxWd09D9Crfl6D9fwhnDT6EumsLwVcYV
         WPhXagWGygY6SeMPtjxg/MdNwflXiF6dbJaV8RJe8aO3Hw901Dnz9b7YINVdLHFWDC5L
         QbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686743735; x=1689335735;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ykv/GwV2w/s1XOWDjj7UvX/0sKbvp29mJL9R2dK69wc=;
        b=Ct3ZxK/5tEC7kLH3lKhNIL0rHzzbj+Tfe3uMkG6tUBcaya1UqReIb8LU562maiDKgc
         8XxkUG/hyJCVRyrjBjnP+97uIeuiVtECXWPe0OXj0lj3th1oJdR7MacdO/FkwjKnfi1A
         eVhFeCnd4eA944POu8+fvWSwU+wcUcnUfjpFEMlUTvhaQHPndljugoJnpxtAZJYUNvkd
         f6dZFH+jLcmTjHQV7yF7TM/Mmt3aAMXIUXGyPqHrGZw/HdkTNm++n0MTpbjGL4G8Gify
         U5rY3DT33CJg/ae5HWSbd6FnwDDhQxK5RzSHiCd99anMnAZ8D9GTia80i8spQWALSxVH
         13EA==
X-Gm-Message-State: AC+VfDxa5SlJbQNzR+oGzcQV96e4DO5tTubFXUHknKDn8WcAvA3/cb/I
        QOY0Ttk9viFNdiQFEqToz/yb311fayDB3QhmFDY=
X-Google-Smtp-Source: ACHHUZ7UIgwPnNgtVg8gTMmxTLbVJ6LtLPWnod6cj64WHWT1Ri75+jSp2Zz2YTYWMn4FC16sclFpjw==
X-Received: by 2002:a05:6512:2f5:b0:4f6:7e3:ac87 with SMTP id m21-20020a05651202f500b004f607e3ac87mr9216669lfq.14.1686743734996;
        Wed, 14 Jun 2023 04:55:34 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ja15-20020a05600c556f00b003f61177faffsm6547045wmb.0.2023.06.14.04.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 04:55:34 -0700 (PDT)
Message-ID: <5e9e525a-690d-38ce-d80f-da433d4062fd@linaro.org>
Date:   Wed, 14 Jun 2023 12:55:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] ALSA: compress: allow setting codec params after next
 track
Content-Language: en-US
To:     Takashi Iwai <tiwai@suse.de>
Cc:     vkoul@kernel.org, broonie@kernel.org, tiwai@suse.com,
        corbet@lwn.net, alsa-devel@alsa-project.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_plai@quicinc.com, quic_mohs@quicinc.com
References: <20230609150416.24525-1-srinivas.kandagatla@linaro.org>
 <87edmebk2w.wl-tiwai@suse.de>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <87edmebk2w.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks Takashi for review,

On 14/06/2023 08:04, Takashi Iwai wrote:
> On Fri, 09 Jun 2023 17:04:16 +0200,
> Srinivas Kandagatla wrote:
>>
>> For gapless playback it is possible that each track can have different
>> codec profile with same decoder, for example we have WMA album,
>> we may have different tracks as WMA v9, WMA v10 and so on
>>
>> Or if DSP's like QDSP have abililty to switch decoders on single stream
>> for each track, then this call could be used to set new codec parameters.
>>
>> Existing code does not allow to change this profile while doing gapless
>> playback.
>>
>> Reuse existing SNDRV_COMPRESS_SET_PARAMS to set this new track params along
>> some additional checks to enforce proper state machine.
>>
>> With this new changes now the user can call SNDRV_COMPRESS_SET_PARAMS
>> anytime after setting next track and additional check in write should
>> also ensure that params are set before writing new data.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>> Changes since v1/RFC:
>> 	- removed introduction of new IOCTL, as suggested.
>> 	- update the state-machine doc.
>>
>>   .../sound/designs/compress-offload.rst        | 52 +++++++++----------
>>   sound/core/compress_offload.c                 | 10 ++--
>>   2 files changed, 33 insertions(+), 29 deletions(-)
>>
>> diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
>> index 935f325dbc77..205cadcabe70 100644
>> --- a/Documentation/sound/designs/compress-offload.rst
>> +++ b/Documentation/sound/designs/compress-offload.rst
>> @@ -256,32 +256,32 @@ Gapless Playback SM
>>   For Gapless, we move from running state to partial drain and back, along
>>   with setting of meta_data and signalling for next track ::
>>   
>> -
>> -                                        +----------+
>> -                compr_drain_notify()    |          |
>> -              +------------------------>|  RUNNING |
>> -              |                         |          |
>> -              |                         +----------+
>> -              |                              |
>> -              |                              |
>> -              |                              | compr_next_track()
>> -              |                              |
>> -              |                              V
>> -              |                         +----------+
>> -              |                         |          |
>> -              |                         |NEXT_TRACK|
>> -              |                         |          |
>> -              |                         +----------+
>> -              |                              |
>> -              |                              |
>> -              |                              | compr_partial_drain()
>> -              |                              |
>> -              |                              V
>> -              |                         +----------+
>> -              |                         |          |
>> -              +------------------------ | PARTIAL_ |
>> -                                        |  DRAIN   |
>> -                                        +----------+
>> +                            +----------+
>> +     compr_drain_notify()   |          | compr_set_params() iff next-track set.
>> +  +------------------------>|  RUNNING |----------------------+
>> +  |                         |          |                      |
>> +  |                         +----------+                      |
>> +  |                              |                            |
>> +  |                              |                            |
>> +  |                              | compr_next_track()         |
>> +  |                              |                            V
>> +  |                              V                            |
>> +  |                         +----------+                      |
>> +  |                         |          |                      |
>> +  |                         |NEXT_TRACK|                      |
>> +  |                         |          |                      |
>> +  |                         +----------+                      |
>> +  |                              |                            |
>> +  |                              +----------------------------+
>> +  |                              |
>> +  |                              | compr_partial_drain()
>> +  |                              |
>> +  |                              V
>> +  |                         +----------+
>> +  |                         |          |
>> +  +------------------------ | PARTIAL_ |
>> +                            |  DRAIN   |
>> +                            +----------+
>>   
>>   Not supported
>>   =============
>> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
>> index 243acad89fd3..fe67228e74b3 100644
>> --- a/sound/core/compress_offload.c
>> +++ b/sound/core/compress_offload.c
>> @@ -294,6 +294,9 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
>>   	case SNDRV_PCM_STATE_SETUP:
>>   	case SNDRV_PCM_STATE_PREPARED:
>>   	case SNDRV_PCM_STATE_RUNNING:
>> +		/* Make sure next track params are set before writing new data */
>> +		if (stream->next_track)
>> +			return -EPERM;
> 
> Hm, does this logic correctly match with the comment above?
Yes I agree, it bit confusing and also going to break the partial drain 
path.
> Also, this misses the mutex unlock.

Thinking about this again, Its not required have this check here to 
start with.

Something like below works, I can send this as v3, if this looks fine.

------------------------->cut<----------------------------------

diff --git a/Documentation/sound/designs/compress-offload.rst 
b/Documentation/sound/designs/compress-offload.rst
index 935f325dbc77..655624f77092 100644
--- a/Documentation/sound/designs/compress-offload.rst
+++ b/Documentation/sound/designs/compress-offload.rst
@@ -268,11 +268,12 @@ with setting of meta_data and signalling for next 
track ::
                |                              |
                |                              V
                |                         +----------+
-              |                         |          |
-              |                         |NEXT_TRACK|
-              |                         |          |
-              |                         +----------+
-              |                              |
+              |    compr_set_params()   |          |
+              |             +-----------|NEXT_TRACK|
+              |             |           |          |
+              |             |           +--+-------+
+              |             |              | |
+              |             +--------------+ |
                |                              |
                |                              | compr_partial_drain()
                |                              |
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 243acad89fd3..30f73097447b 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -589,7 +589,7 @@ snd_compr_set_params(struct snd_compr_stream 
*stream, unsigned long arg)
         struct snd_compr_params *params;
         int retval;

-       if (stream->runtime->state == SNDRV_PCM_STATE_OPEN) {
+       if (stream->runtime->state == SNDRV_PCM_STATE_OPEN || 
stream->next_track) {
                 /*
                  * we should allow parameter change only when stream 
has been
                  * opened not in other cases
@@ -612,6 +612,9 @@ snd_compr_set_params(struct snd_compr_stream 
*stream, unsigned long arg)
                 if (retval)
                         goto out;

+               if (stream->next_track)
+                       goto out;
+
                 stream->metadata_set = false;
                 stream->next_track = false;
------------------------->cut<----------------------------------

> 
> 
> thanks,
> 
> Takashi
