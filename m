Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5AA2B7DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 12:27:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752754AbeDSM1W (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 08:27:22 -0400
Received: from www62.your-server.de ([213.133.104.62]:41297 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751957AbeDSM1H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Apr 2018 08:27:07 -0400
Received: from [62.202.221.10] (helo=linux.home)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-SHA:256)
        (Exim 4.85_2)
        (envelope-from <daniel@iogearbox.net>)
        id 1f98eW-0006sF-Qg; Thu, 19 Apr 2018 14:27:04 +0200
Subject: Re: [PATCH bpf-next v3 5/8] bpf: add documentation for eBPF helpers
 (33-41)
To:     Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-6-quentin.monnet@netronome.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <de8e9531-8833-e22e-1b65-ec400d7979a7@iogearbox.net>
Date:   Thu, 19 Apr 2018 14:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20180417143438.7018-6-quentin.monnet@netronome.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.99.3/24493/Thu Apr 19 06:26:34 2018)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/17/2018 04:34 PM, Quentin Monnet wrote:
> Add documentation for eBPF helper functions to bpf.h user header file.
> This documentation can be parsed with the Python script provided in
> another commit of the patch series, in order to provide a RST document
> that can later be converted into a man page.
> 
> The objective is to make the documentation easily understandable and
> accessible to all eBPF developers, including beginners.
> 
> This patch contains descriptions for the following helper functions, all
> written by Daniel:
> 
> - bpf_get_hash_recalc()
> - bpf_skb_change_tail()
> - bpf_skb_pull_data()
> - bpf_csum_update()
> - bpf_set_hash_invalid()
> - bpf_get_numa_node_id()
> - bpf_set_hash()
> - bpf_skb_adjust_room()
> - bpf_xdp_adjust_meta()
> 
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> ---
>  include/uapi/linux/bpf.h | 155 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 155 insertions(+)
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index d748f65a8f58..3a40f5debac2 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -965,9 +965,164 @@ union bpf_attr {
>   * 	Return
>   * 		0 on success, or a negative error in case of failure.
>   *
> + * u32 bpf_get_hash_recalc(struct sk_buff *skb)
> + * 	Description
> + * 		Retrieve the hash of the packet, *skb*\ **->hash**. If it is
> + * 		not set, in particular if the hash was cleared due to mangling,
> + * 		recompute this hash. Later accesses to the hash can be done
> + * 		directly with *skb*\ **->hash**.
> + *
> + * 		Calling **bpf_set_hash_invalid**\ (), changing a packet
> + * 		prototype with **bpf_skb_change_proto**\ (), or calling
> + * 		**bpf_skb_store_bytes**\ () with the
> + * 		**BPF_F_INVALIDATE_HASH** are actions susceptible to clear
> + * 		the hash and to trigger a new computation for the next call to
> + * 		**bpf_get_hash_recalc**\ ().
> + * 	Return
> + * 		The 32-bit hash.
> + *
>   * u64 bpf_get_current_task(void)
>   * 	Return
>   * 		A pointer to the current task struct.
> + *
> + * int bpf_skb_change_tail(struct sk_buff *skb, u32 len, u64 flags)
> + * 	Description
> + * 		Resize (trim or grow) the packet associated to *skb* to the
> + * 		new *len*. The *flags* are reserved for future usage, and must
> + * 		be left at zero.
> + *
> + * 		The basic idea is that the helper performs the needed work to
> + * 		change the size of the packet, then the eBPF program rewrites
> + * 		the rest via helpers like **bpf_skb_store_bytes**\ (),
> + * 		**bpf_l3_csum_replace**\ (), **bpf_l3_csum_replace**\ ()
> + * 		and others. This helper is a slow path utility intended for
> + * 		replies with control messages. And because it is targeted for
> + * 		slow path, the helper itself can afford to be slow: it
> + * 		implicitly linearizes, unclones and drops offloads from the
> + * 		*skb*.
> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_skb_pull_data(struct sk_buff *skb, u32 len)
> + * 	Description
> + * 		Pull in non-linear data in case the *skb* is non-linear and not
> + * 		all of *len* are part of the linear section. Make *len* bytes
> + * 		from *skb* readable and writable. If a zero value is passed for
> + * 		*len*, then the whole length of the *skb* is pulled.
> + *
> + * 		This helper is only needed for reading and writing with direct
> + * 		packet access.
> + *
> + * 		For direct packet access, when testing that offsets to access
> + * 		are within packet boundaries (test on *skb*\ **->data_end**)
> + * 		fails, programs just bail out, or, in the direct read case, use

I would add here to why it can fail, meaning either due to invalid offsets
or due to the requested data being in non-linear parts of the skb where then
either the bpf_skb_load_bytes() can be used as you mentioned or the data
pulled in via bpf_skb_pull_data().

> + * 		**bpf_skb_load_bytes()** as an alternative to overcome this
> + * 		limitation. If such data sits in non-linear parts, it is
> + * 		possible to pull them in once with the new helper, retest and
> + * 		eventually access them.

You do this here, but maybe slightly rearranging this one paragraph a bit as
to why one would use either of the helpers would help reading flow a bit.

> + * 		At the same time, this also makes sure the skb is uncloned,
> + * 		which is a necessary condition for direct write. As this needs
> + * 		to be an invariant for the write part only, the verifier
> + * 		detects writes and adds a prologue that is calling
> + * 		**bpf_skb_pull_data()** to effectively unclone the skb from the
> + * 		very beginning in case it is indeed cloned.
> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * s64 bpf_csum_update(struct sk_buff *skb, __wsum csum)
> + * 	Description
> + * 		Add the checksum *csum* into *skb*\ **->csum** in case the
> + * 		driver fed us an IP checksum. Return an error otherwise. This

It's not IP checksum specifically (if that is what you meant), it's when the
driver propagates CHECKSUM_COMPLETE to the skb, where the device has supplied
the checksum of the whole packet into skb->csum. At TC ingress time, this
covers everything starting from net header offset to the end of the skb since
mac hdr skb->csum has been pulled already. Main use case indeed direct packet
access.

> + * 		header is intended to be used in combination with
> + * 		**bpf_csum_diff()** helper, in particular when the checksum
> + * 		needs to be updated after data has been written into the packet
> + * 		through direct packet access.
> + * 	Return
> + * 		The checksum on success, or a negative error code in case of
> + * 		failure.
> + *
> + * void bpf_set_hash_invalid(struct sk_buff *skb)
> + * 	Description
> + * 		Invalidate the current *skb*\ **->hash**. It can be used after
> + * 		mangling on headers through direct packet access, in order to
> + * 		indicate that the hash is outdated and to trigger a
> + * 		recalculation the next time the kernel tries to access this
> + * 		hash.

[...] hash or through the helper bpf_get_hash_recalc().

> + *
> + * int bpf_get_numa_node_id(void)
> + * 	Description
> + * 		Return the id of the current NUMA node. The primary use case
> + * 		for this helper is the selection of sockets for the local NUMA
> + * 		node, when the program is attached to sockets using the
> + * 		**SO_ATTACH_REUSEPORT_EBPF** option (see also **socket(7)**).

I would mention that this also available for other types similarly to
bpf_get_smp_processor_id() helper though. (Otherwise one might read that
this could not be the case.)

> + * 	Return
> + * 		The id of current NUMA node.
> + *
> + * u32 bpf_set_hash(struct sk_buff *skb, u32 hash)
> + * 	Description
> + * 		Set the full hash for *skb* (set the field *skb*\ **->hash**)
> + * 		to value *hash*.
> + * 	Return
> + * 		0
> + *
> + * int bpf_skb_adjust_room(struct sk_buff *skb, u32 len_diff, u32 mode, u64 flags)
> + * 	Description
> + * 		Grow or shrink the room for data in the packet associated to
> + * 		*skb* by *len_diff*, and according to the selected *mode*.
> + *
> + * 		There is a single supported mode at this time:
> + *
> + * 		* **BPF_ADJ_ROOM_NET**: Adjust room at the network layer
> + * 		  (room space is added or removed below the layer 3 header).
> + *
> + * 		All values for *flags* are reserved for future usage, and must
> + * 		be left at zero.
> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_xdp_adjust_meta(struct xdp_buff *xdp_md, int delta)
> + * 	Description
> + * 		Adjust the address pointed by *xdp_md*\ **->data_meta** by
> + * 		*delta* (which can be positive or negative). Note that this
> + * 		operation modifies the address stored in *xdp_md*\ **->data**,
> + * 		so the latter must be loaded only after the helper has been
> + * 		called.
> + *
> + * 		The use of *xdp_md*\ **->data_meta** is optional and programs
> + * 		are not required to use it. The rationale is that when the
> + * 		packet is processed with XDP (e.g. as DoS filter), it is
> + * 		possible to push further meta data along with it before passing
> + * 		to the stack, and to give the guarantee that an ingress eBPF
> + * 		program attached as a TC classifier on the same device can pick
> + * 		this up for further post-processing. Since TC works with socket
> + * 		buffers, it remains possible to set from XDP the **mark** or
> + * 		**priority** pointers, or other pointers for the socket buffer.
> + * 		Having this scratch space generic and programmable allows for
> + * 		more flexibility as the user is free to store whatever meta
> + * 		data they need.
> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
>   */
>  #define __BPF_FUNC_MAPPER(FN)		\
>  	FN(unspec),			\
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
