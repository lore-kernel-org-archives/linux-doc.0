Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 799057E279
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Apr 2018 18:54:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751136AbeDTSyn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Apr 2018 14:54:43 -0400
Received: from mail-wr0-f181.google.com ([209.85.128.181]:37625 "EHLO
        mail-wr0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750858AbeDTSyk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Apr 2018 14:54:40 -0400
Received: by mail-wr0-f181.google.com with SMTP id f14-v6so25452699wre.4
        for <linux-doc@vger.kernel.org>; Fri, 20 Apr 2018 11:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6w1APBnwxDG2VjlJijrE6qsquPwvK6w/mw4s2x0Ysjw=;
        b=0S2M65hPX3x8erIUYk8YAoyp5+48vPwnNO+ZF/8pLywhv9ffRBLgh8t0d+0JxZZvjN
         00iigQuWRYTQi/lVKCJpBWeOxtUHWE2y7wNzv27hTWdpXKy2Q8xt3peHLqwSlQOc3z0g
         JFyftxpFQGKjZyf02t4vLniCpyDb81/lS2fMCJY1pB+Umm22QnxVgx1ELwXlbPh3KLQT
         QjlcWDudaN7WvJfnLYS0xkSBHm3R1SVWnFCdsPlyfCSaFyGX727INQV78cHcL0zRojRw
         k4VkmaYQ3K6qZk3BPv0UNp91DwqfmN8zqNAXJkDpTmenjS/o3mT8iMKFW0wjU1MYCJ0X
         K2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6w1APBnwxDG2VjlJijrE6qsquPwvK6w/mw4s2x0Ysjw=;
        b=b4EI7Mm+3gmRzbm0n6pmyi+l63+tPczTwAfGBHNeTV8JbSrfa6QYVftzcWUE7XudTY
         Oz6j564jW4V7Oa8ju8H4HqbRDvqIiGSBzZc7iZip04s09ITtPj8XGHehbjzZR9JVSedp
         /aTzd1UwvdYEbCzF52ufHLjluDItFtr4lb7G9PerxPrNa81kif5BuEzixLLVpLB12Ol1
         HMG3HHCPofbC94UGGrqRRXM625RYrECKV/6rJ4jDE/ziAskg+f5SiVjgnYGNvDVJ++P6
         0jg1ARaoAcybtOMkdVmKCKE0zIK1JqlKSqy3hZpD9w+PAHZyqSy39KSBVBd8DGpGpVU8
         CKvA==
X-Gm-Message-State: ALQs6tBw3DT84lQx7H4yOhUi5Dq5Au1gWQJSeomfu3TGxM0MBOxgE+S2
        dMDqAFF4WkSYXNn2NBkD85Dp4w==
X-Google-Smtp-Source: AB8JxZpKKEqMgnHOJFFEdKdQcfugEOeREXt4A3zcul+xXK3sh4Ms4MwdpVfVBzlnuQmxOyx7WGRCOQ==
X-Received: by 10.28.145.134 with SMTP id t128mr1680682wmd.41.1524250479377;
        Fri, 20 Apr 2018 11:54:39 -0700 (PDT)
Received: from [172.20.1.93] (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id 71sm2760982wmg.11.2018.04.20.11.54.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Apr 2018 11:54:38 -0700 (PDT)
Subject: Re: [PATCH bpf-next v3 4/8] bpf: add documentation for eBPF helpers
 (23-32)
To:     Daniel Borkmann <daniel@iogearbox.net>, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-5-quentin.monnet@netronome.com>
 <6f1b43c7-5d79-7419-1053-d0b29c1e2bb9@iogearbox.net>
From:   Quentin Monnet <quentin.monnet@netronome.com>
Openpgp: preference=signencrypt
Autocrypt: addr=quentin.monnet@netronome.com; prefer-encrypt=mutual; keydata=
 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
 RHhSHGnKaQ6MfrTge5Q0h5A=
Message-ID: <b7ef2bc0-90f7-8bd9-2dd2-3b5ba2a6d4b0@netronome.com>
Date:   Fri, 20 Apr 2018 19:54:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <6f1b43c7-5d79-7419-1053-d0b29c1e2bb9@iogearbox.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-19 13:16 UTC+0200 ~ Daniel Borkmann <daniel@iogearbox.net>
> On 04/17/2018 04:34 PM, Quentin Monnet wrote:
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
>> v3:
>> - bpf_get_prandom_u32(): Fix helper name :(. Add description, including
>>   a note on the internal random state.
>> - bpf_get_smp_processor_id(): Add description, including a note on the
>>   processor id remaining stable during program run.
>> - bpf_get_cgroup_classid(): State that CONFIG_CGROUP_NET_CLASSID is
>>   required to use the helper. Add a reference to related documentation.
>>   State that placing a task in net_cls controller disables cgroup-bpf.
>> - bpf_get_route_realm(): State that CONFIG_CGROUP_NET_CLASSID is
>>   required to use this helper.
>> - bpf_skb_load_bytes(): Fix comment on current use cases for the helper.
>>
>> Cc: Daniel Borkmann <daniel@iogearbox.net>
>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
>> ---
>>  include/uapi/linux/bpf.h | 152 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 152 insertions(+)
>>
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index c59bf5b28164..d748f65a8f58 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h

[...]

>> @@ -615,6 +632,27 @@ union bpf_attr {
>>   * 	Return
>>   * 		0 on success, or a negative error in case of failure.
>>   *
>> + * u32 bpf_get_cgroup_classid(struct sk_buff *skb)
>> + * 	Description
>> + * 		Retrieve the classid for the current task, i.e. for the
>> + * 		net_cls (network classifier) cgroup to which *skb* belongs.
>> + *
>> + * 		This helper is only available is the kernel was compiled with
>> + * 		the **CONFIG_CGROUP_NET_CLASSID** configuration option set to
>> + * 		"**y**" or to "**m**".
>> + *
>> + * 		Note that placing a task into the net_cls controller completely
>> + * 		disables the execution of eBPF programs with the cgroup.
> 
> I'm not sure I follow the above sentence, what do you mean by that?

Please see comment below.

> I would definitely also add here that this helper is limited to cgroups v1
> only, and that it works on clsact TC egress hook but not the ingress one.
> 
>> + * 		Also note that, in the above description, the "network
>> + * 		classifier" cgroup does not designate a generic classifier, but
>> + * 		a particular mechanism that provides an interface to tag
>> + * 		network packets with a specific class identifier. See also the
> 
> The "generic classifier" part is a bit strange to parse. I would probably
> leave the first part out and explain that this provides a means to tag
> packets based on a user-provided ID for all traffic coming from the tasks
> belonging to the related cgroup.

In this paragraph and in the one above, I am trying to address Alexei
comments to the RFC v2:

    please add that kernel should be configured with
    CONFIG_NET_CLS_CGROUP=y|m
    and mention Documentation/cgroup-v1/net_cls.txt
    Otherwise 'network classifier' is way too generic.
    I'd also mention that placing a task into net_cls controller
    disables all of cgroup-bpf.

But I must admit I am struggling a bit on this helper. If I understand
correctly, "network classifier" is too generic and could be confused
with TC classifiers? Hence the attempt to avoid that in the second
paragraph... As for "placing a task into net_cls controller disables all
of cgroup-bpf", again if I understand correctly, I think it refers to
cgroup_sk_alloc_disable() being called in write_classid() in file
net/core/netclassid_cgroup.c. But I am not familiar with it and cannot
find a nice way to explain that in the doc :/.

>> + * 		related kernel documentation, available from the Linux sources
>> + * 		in file *Documentation/cgroup-v1/net_cls.txt*.
>> + * 	Return
>> + * 		The classid, or 0 for the default unconfigured classid.
>> + *
>>   * int bpf_skb_vlan_push(struct sk_buff *skb, __be16 vlan_proto, u16 vlan_tci)
>>   * 	Description
>>   * 		Push a *vlan_tci* (VLAN tag control information) of protocol
>> @@ -734,6 +772,16 @@ union bpf_attr {
>>   * 		are **TC_ACT_REDIRECT** on success or **TC_ACT_SHOT** on
>>   * 		error.
>>   *
>> + * u32 bpf_get_route_realm(struct sk_buff *skb)
>> + * 	Description
>> + * 		Retrieve the realm or the route, that is to say the
>> + * 		**tclassid** field of the destination for the *skb*. This
>> + * 		helper is available only if the kernel was compiled with
>> + * 		**CONFIG_IP_ROUTE_CLASSID** configuration option.
> 
> Could mention that this is a similar user provided tag like in the net_cls
> case with cgroups only that this applies to routes here (dst entries) which
> hold this tag.
> 
> Also, should say that this works with clsact TC egress hook or alternatively
> conventional classful egress qdiscs, but not on TC ingress. In case of clsact
> TC egress hook this has the advantage that the dst entry has not been dropped
> yet in the xmit path. Therefore, the dst entry does not need to be artificially
> held via netif_keep_dst() for a classful qdisc until the skb is freed.

Here I am not sure to follow, the advantage is for clsact, but this is
only for a classful qdisc that we can avoid holding the dst entry? How
does holding the entry with netif_keep_dst() translate, from a user
space point of view?

Thanks a lot for the exhaustive review!
Quentin
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
