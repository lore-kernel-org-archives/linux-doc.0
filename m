Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5756E7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 14:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752643AbeDROJq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 10:09:46 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:37241 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751383AbeDROJo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 10:09:44 -0400
Received: by mail-wr0-f195.google.com with SMTP id f14-v6so5244796wre.4
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 07:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cXIsRmEJPlMyH8fHOjruuHv8QBZ0x+UfZuRiUCwOCAI=;
        b=dDiq9n3Z/dqNkaXZLD9ftBL3BTyKkilzVUSochRH5OrBG97bJqt1BgdMLAsbCPGoIr
         Ie7+0Aw9U0Sf0JyirrCV1xQkDe9Y1hbrSSf69wMvYVXTtJJEbY7aa91ziRX962UbQoRe
         HVa+n9vQJ9sN3DtHArqygjyWn1eu/7IiVQ7gS1QeLpKXappNBah8lHausLWGaaFP1bLo
         JuwvfROSSlPy/6KuGTYyIlK4JyuozuovKxATPESUf5kIypMFy6GN33rS4e5cCM8eWTsg
         4GfqHNt1k0bWmyJ0cqnqkN7WjjzLdyY+h+V4JHj0KbdgMot3KbPBNW/GFhRjA//QcGzm
         AZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=cXIsRmEJPlMyH8fHOjruuHv8QBZ0x+UfZuRiUCwOCAI=;
        b=pROg8JVMrNU2EqB3qS8BViwjFyQFVqywZCE5dqg+b1z2rEAEtZn635C/1YrnTjxW3F
         PU+SyCm5Z+XBjwXFs7y1LSpZw6iyjzsv8KAGGVi4bv69j45Ny3+wi91/76kKZ2g1vrtI
         JcdNB1Xi+ObRdFdbvo9kYivIjmQxhux2sfxz42F/0tJn6jvJG6eYCneUZLd87sEXU+Jd
         XKVqwTXiCdhounEyq8jo6xvAJxxV6ePm3x8QlfsCqGpSKP/x/KIfY2Ov7CVuzUQz607k
         ZSdJM6RnkPP0LvMaRWWnVyZChW4Y+UFuBprIauW9hHFpmjQCNlFrOlV7bhKKct8LH+E3
         EznQ==
X-Gm-Message-State: ALQs6tBd4UTyYDNkc4p9r/zmmMvN9dBfYoIck3X9LA7g3Eg9mY2t8ABF
        UXvASg3dQBR+zHInxVPT/HpGBg==
X-Google-Smtp-Source: AIpwx4/hY9oK7+EbMZXsUuUdu+X5fA+379LzMcagHDHmbaB/j6n+IFBHkphJAV5RQk9ATkWMZ375WA==
X-Received: by 10.80.169.117 with SMTP id m50mr3419226edc.242.1524060583080;
        Wed, 18 Apr 2018 07:09:43 -0700 (PDT)
Received: from [172.20.1.93] (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id x18sm382158edi.58.2018.04.18.07.09.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 07:09:42 -0700 (PDT)
Subject: Re: [PATCH bpf-next v3 8/8] bpf: add documentation for eBPF helpers
 (58-64)
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org,
        John Fastabend <john.fastabend@gmail.com>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-9-quentin.monnet@netronome.com>
 <20180418153448.574c6814@redhat.com>
From:   Quentin Monnet <quentin.monnet@netronome.com>
Openpgp: preference=signencrypt
Autocrypt: addr=quentin.monnet@netronome.com; prefer-encrypt=mutual; keydata=
 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
 RHhSHGnKaQ6MfrTge5Q0h5A=
Message-ID: <67e84a95-5e7b-1c2c-e90f-7bcc0026bd10@netronome.com>
Date:   Wed, 18 Apr 2018 15:09:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180418153448.574c6814@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-18 15:34 UTC+0200 ~ Jesper Dangaard Brouer <brouer@redhat.com>
> On Tue, 17 Apr 2018 15:34:38 +0100
> Quentin Monnet <quentin.monnet@netronome.com> wrote:
> 
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index 350459c583de..3d329538498f 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h
>> @@ -1276,6 +1276,50 @@ union bpf_attr {
>>   * 	Return
>>   * 		0 on success, or a negative error in case of failure.
>>   *
>> + * int bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
>> + * 	Description
>> + * 		Redirect the packet to the endpoint referenced by *map* at
>> + * 		index *key*. Depending on its type, his *map* can contain
>                                                     ^^^
> 
> "his" -> "this"

Thanks!

>> + * 		references to net devices (for forwarding packets through other
>> + * 		ports), or to CPUs (for redirecting XDP frames to another CPU;
>> + * 		but this is only implemented for native XDP (with driver
>> + * 		support) as of this writing).
>> + *
>> + * 		All values for *flags* are reserved for future usage, and must
>> + * 		be left at zero.
>> + * 	Return
>> + * 		**XDP_REDIRECT** on success, or **XDP_ABORT** on error.
>> + *
> 
> "XDP_ABORT" -> "XDP_ABORTED"

Ouch. And I did the same for bpf_redirect(). Thanks for the catch.

> 
> I don't know if it's worth mentioning in the doc/man-page; that for XDP
> using bpf_redirect_map() is a HUGE performance advantage, compared to
> the bpf_redirect() call ?

It seems worth to me. How would you simply explain the reason for this
difference?

Quentin
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
