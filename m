Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 87C467DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 12:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751695AbeDSMsE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 08:48:04 -0400
Received: from www62.your-server.de ([213.133.104.62]:43544 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751110AbeDSMsB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Apr 2018 08:48:01 -0400
Received: from [62.202.221.10] (helo=linux.home)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-SHA:256)
        (Exim 4.85_2)
        (envelope-from <daniel@iogearbox.net>)
        id 1f98yl-0008Cx-DW; Thu, 19 Apr 2018 14:47:59 +0200
Subject: Re: [PATCH bpf-next v3 7/8] bpf: add documentation for eBPF helpers
 (51-57)
To:     Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org,
        Lawrence Brakmo <brakmo@fb.com>, Yonghong Song <yhs@fb.com>,
        Josef Bacik <jbacik@fb.com>, Andrey Ignatov <rdna@fb.com>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-8-quentin.monnet@netronome.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <3f8a6ef6-04da-0dd8-0183-4a79383aefb3@iogearbox.net>
Date:   Thu, 19 Apr 2018 14:47:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20180417143438.7018-8-quentin.monnet@netronome.com>
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
> This patch contains descriptions for the following helper functions:
> 
> Helpers from Lawrence:
> - bpf_setsockopt()
> - bpf_getsockopt()
> - bpf_sock_ops_cb_flags_set()
> 
> Helpers from Yonghong:
> - bpf_perf_event_read_value()
> - bpf_perf_prog_read_value()
> 
> Helper from Josef:
> - bpf_override_return()
> 
> Helper from Andrey:
> - bpf_bind()
> 
> v3:
> - bpf_perf_event_read_value(): Fix time of selection for perf event type
>   in description. Remove occurences of "cores" to avoid confusion with
>   "CPU".
> - bpf_bind(): Remove last paragraph of description, which was off topic.
> 
> Cc: Lawrence Brakmo <brakmo@fb.com>
> Cc: Yonghong Song <yhs@fb.com>
> Cc: Josef Bacik <jbacik@fb.com>
> Cc: Andrey Ignatov <rdna@fb.com>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> 
> fix patch 7: Yonghong and Andrey
> ---
>  include/uapi/linux/bpf.h | 178 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index dd79a1c82adf..350459c583de 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -1234,6 +1234,28 @@ union bpf_attr {
>   * 	Return
>   * 		0
>   *
> + * int bpf_setsockopt(struct bpf_sock_ops_kern *bpf_socket, int level, int optname, char *optval, int optlen)
> + * 	Description
> + * 		Emulate a call to **setsockopt()** on the socket associated to
> + * 		*bpf_socket*, which must be a full socket. The *level* at
> + * 		which the option resides and the name *optname* of the option
> + * 		must be specified, see **setsockopt(2)** for more information.
> + * 		The option value of length *optlen* is pointed by *optval*.
> + *
> + * 		This helper actually implements a subset of **setsockopt()**.
> + * 		It supports the following *level*\ s:
> + *
> + * 		* **SOL_SOCKET**, which supports the following *optname*\ s:
> + * 		  **SO_RCVBUF**, **SO_SNDBUF**, **SO_MAX_PACING_RATE**,
> + * 		  **SO_PRIORITY**, **SO_RCVLOWAT**, **SO_MARK**.
> + * 		* **IPPROTO_TCP**, which supports the following *optname*\ s:
> + * 		  **TCP_CONGESTION**, **TCP_BPF_IW**,
> + * 		  **TCP_BPF_SNDCWND_CLAMP**.
> + * 		* **IPPROTO_IP**, which supports *optname* **IP_TOS**.
> + * 		* **IPPROTO_IPV6**, which supports *optname* **IPV6_TCLASS**.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
>   * int bpf_skb_adjust_room(struct sk_buff *skb, u32 len_diff, u32 mode, u64 flags)
>   * 	Description
>   * 		Grow or shrink the room for data in the packet associated to
> @@ -1281,6 +1303,162 @@ union bpf_attr {
>   * 		performed again.
>   * 	Return
>   * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_perf_event_read_value(struct bpf_map *map, u64 flags, struct bpf_perf_event_value *buf, u32 buf_size)
> + * 	Description
> + * 		Read the value of a perf event counter, and store it into *buf*
> + * 		of size *buf_size*. This helper relies on a *map* of type
> + * 		**BPF_MAP_TYPE_PERF_EVENT_ARRAY**. The nature of the perf event
> + * 		counter is selected when *map* is updated with perf event file
> + * 		descriptors. The *map* is an array whose size is the number of
> + * 		available CPUs, and each cell contains a value relative to one
> + * 		CPU. The value to retrieve is indicated by *flags*, that
> + * 		contains the index of the CPU to look up, masked with
> + * 		**BPF_F_INDEX_MASK**. Alternatively, *flags* can be set to
> + * 		**BPF_F_CURRENT_CPU** to indicate that the value for the
> + * 		current CPU should be retrieved.
> + *
> + * 		This helper behaves in a way close to
> + * 		**bpf_perf_event_read**\ () helper, save that instead of
> + * 		just returning the value observed, it fills the *buf*
> + * 		structure. This allows for additional data to be retrieved: in
> + * 		particular, the enabled and running times (in *buf*\
> + * 		**->enabled** and *buf*\ **->running**, respectively) are
> + * 		copied.

Since you mention bpf_perf_event_read() here, we should mention that
bpf_perf_event_read_value() is recommended over bpf_perf_event_read()
in general. The latter bpf_perf_event_read() has some ABI quirks where
error and counter value are used as a return code (which is obviously
wrong to do since ranges may overlap). bpf_perf_event_read_value()
fixed this but also provides more features at the same time over the
old interface.

> + * 		These values are interesting, because hardware PMU (Performance
> + * 		Monitoring Unit) counters are limited resources. When there are
> + * 		more PMU based perf events opened than available counters,
> + * 		kernel will multiplex these events so each event gets certain
> + * 		percentage (but not all) of the PMU time. In case that
> + * 		multiplexing happens, the number of samples or counter value
> + * 		will not reflect the case compared to when no multiplexing
> + * 		occurs. This makes comparison between different runs difficult.
> + * 		Typically, the counter value should be normalized before
> + * 		comparing to other experiments. The usual normalization is done
> + * 		as follows.
> + *
> + * 		::
> + *
> + * 			normalized_counter = counter * t_enabled / t_running
> + *
> + * 		Where t_enabled is the time enabled for event and t_running is
> + * 		the time running for event since last normalization. The
> + * 		enabled and running times are accumulated since the perf event
> + * 		open. To achieve scaling factor between two invocations of an
> + * 		eBPF program, users can can use CPU id as the key (which is
> + * 		typical for perf array usage model) to remember the previous
> + * 		value and do the calculation inside the eBPF program.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_perf_prog_read_value(struct bpf_perf_event_data_kern *ctx, struct bpf_perf_event_value *buf, u32 buf_size)
> + * 	Description
> + * 		For en eBPF program attached to a perf event, retrieve the
> + * 		value of the event counter associated to *ctx* and store it in
> + * 		the structure pointed by *buf* and of size *buf_size*. Enabled
> + * 		and running times are also stored in the structure (see
> + * 		description of helper **bpf_perf_event_read_value**\ () for
> + * 		more details).

Ditto, mentioning here that bpf_perf_event_read_value() should be used instead.

> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_getsockopt(struct bpf_sock_ops_kern *bpf_socket, int level, int optname, char *optval, int optlen)
> + * 	Description
> + * 		Emulate a call to **getsockopt()** on the socket associated to
> + * 		*bpf_socket*, which must be a full socket. The *level* at
> + * 		which the option resides and the name *optname* of the option
> + * 		must be specified, see **getsockopt(2)** for more information.
> + * 		The retrieved value is stored in the structure pointed by
> + * 		*opval* and of length *optlen*.
> + *
> + * 		This helper actually implements a subset of **getsockopt()**.
> + * 		It supports the following *level*\ s:
> + *
> + * 		* **IPPROTO_TCP**, which supports *optname*
> + * 		  **TCP_CONGESTION**.
> + * 		* **IPPROTO_IP**, which supports *optname* **IP_TOS**.
> + * 		* **IPPROTO_IPV6**, which supports *optname* **IPV6_TCLASS**.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
[...]
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
