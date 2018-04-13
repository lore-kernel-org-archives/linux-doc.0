Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2BD007DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 18:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751380AbeDMSSo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 14:18:44 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:37415 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750940AbeDMSSm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 14:18:42 -0400
Received: by mail-wr0-f193.google.com with SMTP id l49so10326665wrl.4
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 11:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CSYoGLCFG8md3JkypAjGPbQAt/8wRv/zmEdTenJDatg=;
        b=AVqpOydRxOTL/MqMb02bRI1FYEeRlSEcRG6we+L9JxSLPziH4USdeIFhXhLVwtqBnI
         erZwDPqk0sDPxJTJDXEf+tuNtwwOyit3tCczFrRS11QTX/DyksPUTsXQaOzevESZMw/a
         GqbBSVLkxflL53bsFYrOZbhqjZ2HJtwpOWP4p67GXgfQL+1ZlGGjdceej1YnCIOV+Xw8
         KWNkXFs9iNgI99n6QWatFhHkGxf+zWBpjZgUIHPI7zmz7aStHELpalUX4ASB8m9jUEdK
         qR6PDwewQRERTO1K2x5PYH7yJYCDP1gKoFvzul974yhi3Onyxwy/NrPUbLBB3+jE1CKo
         Xbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CSYoGLCFG8md3JkypAjGPbQAt/8wRv/zmEdTenJDatg=;
        b=Rpmsl8no4EwEyGx663b8xO8/npT52WM25fiK/B01WS6IKuGmGVsOPYHAXM6XNBq54M
         BiT8SAWdID4GRVllAj1DiSrsNz5DiW4E0chYOjAXGqdMtO7lO6/gOH7SQFtjKs6bvZ4H
         2H8MhTVFVM0U68bqoZc+BwSCdib0lPZ85f8TkSYvrVR+gujuMlHpoC8Qu0ERPxkjdupY
         gaqJwno9M/U+1fMjRVThe++ahr7KSDQcdVlJFbPby2B0coxVLaMQUF1lk3zVvNV4RL+0
         HvSsvC3jOzXE/DKRlUGkzRtCZ4t4GgahlNq5ueKKOcEst8Zs5+SPyR3RHgTkJgweyCS5
         hPZg==
X-Gm-Message-State: ALQs6tDdaei93nDpfJTbZohyacw4tZFcu1icMozIVIkAL2tfxqKwL4SG
        5RlYtINKs8LsDUNqnXsEmnnPWQ==
X-Google-Smtp-Source: AIpwx48IzkTNDN3/EGpBCTsLAJvLqu76K58WePayYeqklKFU4QKIr8qmOgNqs8KUCw07RBUYGWRYzQ==
X-Received: by 10.28.232.206 with SMTP id f75mr4624985wmi.121.1523643520641;
        Fri, 13 Apr 2018 11:18:40 -0700 (PDT)
Received: from [172.20.1.93] (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id q138sm2566418wmd.1.2018.04.13.11.18.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Apr 2018 11:18:40 -0700 (PDT)
Subject: Re: [RFC bpf-next v2 4/8] bpf: add documentation for eBPF helpers
 (23-32)
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-5-quentin.monnet@netronome.com>
 <20180413002838.atu7shp5cuubx32p@ast-mbp.dhcp.thefacebook.com>
From:   Quentin Monnet <quentin.monnet@netronome.com>
Openpgp: preference=signencrypt
Autocrypt: addr=quentin.monnet@netronome.com; prefer-encrypt=mutual; keydata=
 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
 RHhSHGnKaQ6MfrTge5Q0h5A=
Message-ID: <866e9593-0247-87e6-35d8-6fde1f8e382b@netronome.com>
Date:   Fri, 13 Apr 2018 19:18:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180413002838.atu7shp5cuubx32p@ast-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-12 17:28 UTC-0700 ~ Alexei Starovoitov
<alexei.starovoitov@gmail.com>
> On Tue, Apr 10, 2018 at 03:41:53PM +0100, Quentin Monnet wrote:
>> Add documentation for eBPF helper functions to bpf.h user header file.
>> This documentation can be parsed with the Python script provided in
>> another commit of the patch series, in order to provide a RST document
>> that can later be converted into a man page.
>>
>> The objective is to make the documentation easily understandable and
>> accessible to all eBPF developers, including beginners.
>>
>> This patch contains descriptions for the following helper functions, all
>> written by Daniel:
>>
>> - bpf_get_prandom_u32()
>> - bpf_get_smp_processor_id()
>> - bpf_get_cgroup_classid()
>> - bpf_get_route_realm()
>> - bpf_skb_load_bytes()
>> - bpf_csum_diff()
>> - bpf_skb_get_tunnel_opt()
>> - bpf_skb_set_tunnel_opt()
>> - bpf_skb_change_proto()
>> - bpf_skb_change_type()
>>
>> Cc: Daniel Borkmann <daniel@iogearbox.net>
>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
>> ---
>>  include/uapi/linux/bpf.h | 125 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 125 insertions(+)
>>
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index f3ea8824efbc..d147d9dd6a83 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h

[...]

>> @@ -604,6 +612,13 @@ union bpf_attr {
>>   * 	Return
>>   * 		0 on success, or a negative error in case of failure.
>>   *
>> + * u32 bpf_get_cgroup_classid(struct sk_buff *skb)
>> + * 	Description
>> + * 		Retrieve the classid for the current task, i.e. for the
>> + * 		net_cls (network classifier) cgroup to which *skb* belongs.
> 
> please add that kernel should be configured with CONFIG_NET_CLS_CGROUP=y|m
> and mention Documentation/cgroup-v1/net_cls.txt

Ok.

> Otherwise 'network classifier' is way too generic.

I am not so familiar with cgroups. What would you suggest instead?

> I'd also mention that placing a task into net_cls controller
> disables all of cgroup-bpf.

Could you please explain a bit more? Placing a task into the controller
is using:

	echo <task_pid>  >  /sys/fs/cgroup/<my_cgroup_name>/tasks

correct? Then if I do this, it disables all of cgroup-bpf. Does this
mean that I loose the possibility to use or add BPF programs to all
cgroup-related attach points for this cgroup? I think I missed something
here.

>> + * 	Return
>> + * 		The classid, or 0 for the default unconfigured classid.
>> + *
>>   * int bpf_skb_vlan_push(struct sk_buff *skb, __be16 vlan_proto, u16 vlan_tci)
>>   * 	Description
>>   * 		Push a *vlan_tci* (VLAN tag control information) of protocol

I have no particular comments on the other items you reported on this
patch, I will fix them. Thanks!

Quentin
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
