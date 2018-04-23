Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 143E07E677
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Apr 2018 09:11:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754174AbeDWJLN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Apr 2018 05:11:13 -0400
Received: from www62.your-server.de ([213.133.104.62]:55531 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754078AbeDWJLL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Apr 2018 05:11:11 -0400
Received: from [62.202.221.10] (helo=linux.home)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-SHA:256)
        (Exim 4.85_2)
        (envelope-from <daniel@iogearbox.net>)
        id 1fAXV6-0007O8-TL; Mon, 23 Apr 2018 11:11:09 +0200
Subject: Re: [PATCH bpf-next v3 4/8] bpf: add documentation for eBPF helpers
 (23-32)
To:     Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-5-quentin.monnet@netronome.com>
 <6f1b43c7-5d79-7419-1053-d0b29c1e2bb9@iogearbox.net>
 <b7ef2bc0-90f7-8bd9-2dd2-3b5ba2a6d4b0@netronome.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <c287e127-fa51-0e43-21d0-8fed1f944077@iogearbox.net>
Date:   Mon, 23 Apr 2018 11:11:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <b7ef2bc0-90f7-8bd9-2dd2-3b5ba2a6d4b0@netronome.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.99.3/24505/Mon Apr 23 06:24:23 2018)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/20/2018 08:54 PM, Quentin Monnet wrote:
> 2018-04-19 13:16 UTC+0200 ~ Daniel Borkmann <daniel@iogearbox.net>
>> On 04/17/2018 04:34 PM, Quentin Monnet wrote:
>>> Add documentation for eBPF helper functions to bpf.h user header file.
>>> This documentation can be parsed with the Python script provided in
>>> another commit of the patch series, in order to provide a RST document
>>> that can later be converted into a man page.
>>>
>>> The objective is to make the documentation easily understandable and
>>> accessible to all eBPF developers, including beginners.
>>>
>>> This patch contains descriptions for the following helper functions, all
>>> written by Daniel:
>>>
>>> - bpf_get_prandom_u32()
>>> - bpf_get_smp_processor_id()
>>> - bpf_get_cgroup_classid()
>>> - bpf_get_route_realm()
>>> - bpf_skb_load_bytes()
>>> - bpf_csum_diff()
>>> - bpf_skb_get_tunnel_opt()
>>> - bpf_skb_set_tunnel_opt()
>>> - bpf_skb_change_proto()
>>> - bpf_skb_change_type()
>>>
>>> v3:
>>> - bpf_get_prandom_u32(): Fix helper name :(. Add description, including
>>>   a note on the internal random state.
>>> - bpf_get_smp_processor_id(): Add description, including a note on the
>>>   processor id remaining stable during program run.
>>> - bpf_get_cgroup_classid(): State that CONFIG_CGROUP_NET_CLASSID is
>>>   required to use the helper. Add a reference to related documentation.
>>>   State that placing a task in net_cls controller disables cgroup-bpf.
>>> - bpf_get_route_realm(): State that CONFIG_CGROUP_NET_CLASSID is
>>>   required to use this helper.
>>> - bpf_skb_load_bytes(): Fix comment on current use cases for the helper.
>>>
>>> Cc: Daniel Borkmann <daniel@iogearbox.net>
>>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
>>> ---
>>>  include/uapi/linux/bpf.h | 152 +++++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 152 insertions(+)
>>>
>>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>>> index c59bf5b28164..d748f65a8f58 100644
>>> --- a/include/uapi/linux/bpf.h
>>> +++ b/include/uapi/linux/bpf.h
> 
> [...]
> 
>>> @@ -615,6 +632,27 @@ union bpf_attr {
>>>   * 	Return
>>>   * 		0 on success, or a negative error in case of failure.
>>>   *
>>> + * u32 bpf_get_cgroup_classid(struct sk_buff *skb)
>>> + * 	Description
>>> + * 		Retrieve the classid for the current task, i.e. for the
>>> + * 		net_cls (network classifier) cgroup to which *skb* belongs.
>>> + *
>>> + * 		This helper is only available is the kernel was compiled with
>>> + * 		the **CONFIG_CGROUP_NET_CLASSID** configuration option set to
>>> + * 		"**y**" or to "**m**".
>>> + *
>>> + * 		Note that placing a task into the net_cls controller completely
>>> + * 		disables the execution of eBPF programs with the cgroup.
>>
>> I'm not sure I follow the above sentence, what do you mean by that?
> 
> Please see comment below.
> 
>> I would definitely also add here that this helper is limited to cgroups v1
>> only, and that it works on clsact TC egress hook but not the ingress one.
>>
>>> + * 		Also note that, in the above description, the "network
>>> + * 		classifier" cgroup does not designate a generic classifier, but
>>> + * 		a particular mechanism that provides an interface to tag
>>> + * 		network packets with a specific class identifier. See also the
>>
>> The "generic classifier" part is a bit strange to parse. I would probably
>> leave the first part out and explain that this provides a means to tag
>> packets based on a user-provided ID for all traffic coming from the tasks
>> belonging to the related cgroup.
> 
> In this paragraph and in the one above, I am trying to address Alexei
> comments to the RFC v2:
> 
>     please add that kernel should be configured with
>     CONFIG_NET_CLS_CGROUP=y|m
>     and mention Documentation/cgroup-v1/net_cls.txt
>     Otherwise 'network classifier' is way too generic.
>     I'd also mention that placing a task into net_cls controller
>     disables all of cgroup-bpf.
> 
> But I must admit I am struggling a bit on this helper. If I understand
> correctly, "network classifier" is too generic and could be confused
> with TC classifiers? Hence the attempt to avoid that in the second

I think if you just name it "net_cls cgroup" it should be good enough in case
the concern is that "network classifier" name would be misunderstood.

> paragraph... As for "placing a task into net_cls controller disables all
> of cgroup-bpf", again if I understand correctly, I think it refers to
> cgroup_sk_alloc_disable() being called in write_classid() in file
> net/core/netclassid_cgroup.c. But I am not familiar with it and cannot
> find a nice way to explain that in the doc :/.

Point here should be that there's cgroups v1 and v2 infra. Both are available
and you can use a mixture of them, but net_cls is v1 only whereas bpf progs on
cgroups is v2 only feature. And if you look at struct sock_cgroup_data, it's
a union for the socket, so you can only use one of them with regards to sockets.

>>> + * 		related kernel documentation, available from the Linux sources
>>> + * 		in file *Documentation/cgroup-v1/net_cls.txt*.
>>> + * 	Return
>>> + * 		The classid, or 0 for the default unconfigured classid.
>>> + *
>>>   * int bpf_skb_vlan_push(struct sk_buff *skb, __be16 vlan_proto, u16 vlan_tci)
>>>   * 	Description
>>>   * 		Push a *vlan_tci* (VLAN tag control information) of protocol
>>> @@ -734,6 +772,16 @@ union bpf_attr {
>>>   * 		are **TC_ACT_REDIRECT** on success or **TC_ACT_SHOT** on
>>>   * 		error.
>>>   *
>>> + * u32 bpf_get_route_realm(struct sk_buff *skb)
>>> + * 	Description
>>> + * 		Retrieve the realm or the route, that is to say the
>>> + * 		**tclassid** field of the destination for the *skb*. This
>>> + * 		helper is available only if the kernel was compiled with
>>> + * 		**CONFIG_IP_ROUTE_CLASSID** configuration option.
>>
>> Could mention that this is a similar user provided tag like in the net_cls
>> case with cgroups only that this applies to routes here (dst entries) which
>> hold this tag.
>>
>> Also, should say that this works with clsact TC egress hook or alternatively
>> conventional classful egress qdiscs, but not on TC ingress. In case of clsact
>> TC egress hook this has the advantage that the dst entry has not been dropped
>> yet in the xmit path. Therefore, the dst entry does not need to be artificially
>> held via netif_keep_dst() for a classful qdisc until the skb is freed.
> 
> Here I am not sure to follow, the advantage is for clsact, but this is
> only for a classful qdisc that we can avoid holding the dst entry? How

No, it's only for sch_clsact where we don't need to hold it. Take a look at
__dev_queue_xmit(), and where sch_handle_egress() is called. It's right before
the dev->priv_flags & IFF_XMIT_DST_RELEASE check where we either hold or drop
the dst from skb.

In cls_bpf_prog_from_efd() the tcf_block_netif_keep_dst() will handle this.
If you call cls_bpf e.g. out of htb via htb_classify() -> tcf_classify()
then you would have to hold it and thus call netif_keep_dst() so that the
test in __dev_queue_xmit() results in holding the dst via skb_dst_force().

Cheers,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
