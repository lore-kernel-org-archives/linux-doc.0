Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134724;
	b=LfO5BGyi6agGNCYmICXAuSs/vfU6CJMvRQVzTjEPlZk2mL7J2ale+SyHzC0dmadS38oU
	 W/j7r6UuHaF8Y2bv2/VWlp6jWmNgrI4JsBTk9jou0p2RGgjTiVVkc5UIYx1XKyDqowqQR
	 UrFZKWvwG8BCwMMgSYdo3dqpgrMFqVAREJUBH/HOlVkkbdh7wvpICf1gu9mdMaAkN9DL6
	 1RUqULwPCTBudkXQ0hATULG6yeFNZT4Iaf9LPG9qMp5E8ZDmlUWZ2PhIwkNL5/2EyI6g4
	 vlfVka0yhVgrgnr+/2D2UdXuQQxDT6ByRzBaO2yzE2qZtpjawjJF53E8o3y8j7ik/eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=qHpbo38glsjEEsMsljy1CpA8VnvlF4qhosKL0SjyrSU=;
	b=deaggxMu4Iu4AfaWr5j9gAXyDYNw1B+1I1kZ3kmfpFXbp38O5MjvvA65VpC1HDQ9N4Rz
	 tA9Gwrm0PjUwAoqpFjAtAANINwkBagdGkdA7kr4ls0IR6j27Y+4aB+7iXgQzMCK5nKQO7
	 ktIv+uks0vIQgdoim9K1OC7airt39Asjkj3UTyM/UWPufvbUvLRyTRFtngaw4ybsnEdLL
	 EogPS26BUfYPH3B4hqjH7PZ4XuJgR0TC0hnkS9UxYNrEWKPfCIBBslvCqlDHOs2R8XrAI
	 Rq+1pypQsxMJkiU8j5TSSwZ0XHMBHlJ2XfohnELd+46J7xn9VuxIut1FbEJSqf7M0lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phY967kf;
	arc=none smtp.remote-ip=74.125.82.193
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE3560A2620
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 00:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE3560A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phY967kf
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-38564b4b017so361508eec.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 16:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134723; x=1795739523; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHpbo38glsjEEsMsljy1CpA8VnvlF4qhosKL0SjyrSU=;
        b=phY967kf9V0w4X6QO0EE5tjsrC4Tea3WS0nk6BNiGcR+p3FtIb0e9GLhbL+NMk9zMG
         qmfj6SqSfdH6XH/AhJsTiFEepvy7zHzzymWFflDAI6L44/pGPpmfiR5jfIOmzN7Y+PkA
         PhsgMlkztWXiRGkox/4ArWbKtc3xJq0ZcZ43TOZSFprhwZMVfIOVNK/RVqDrIUYkloMo
         HAUFx9Yx6xg37Z8tTkyJmk2MofiQ1dClNMNz6tawKx5sLyRG/hQ+SbNZE4xOMJ+8O1yb
         dQIrb9IMG4U2I/83GqX7E4RME7I04WEF/d9PU4W3Riz1Jhk9iATiZvURXlj2KqLotPbb
         osdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134723; x=1795739523;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qHpbo38glsjEEsMsljy1CpA8VnvlF4qhosKL0SjyrSU=;
        b=Ip1iQL8zZWTffHYxXp5NaE09AHg+Gl7r4ruWo/jme1Sg0tRSV3ZvLdhJjS7NAE5LIt
         /XnGFu08Ux3926XPIx6/OLI5FGibAwAJ67es+2GBKfrzAX1g27ucFVR+Ay1stgIAy2H+
         5O+rafFd+OXhfc8eyYG5fmkBKIjwA3VG8wUP3ToCLSC3i50iUQzAlFsEvmkzak0P3j9X
         x4X0aX03g28yJ1rZ+8HF4RpyDwdxWVbFA2SEJD8eV8DlqPDuLRdpSXpCEpNLeHeFa7Km
         TohLbaei9D9VE47V7m5PgDzFQAsCwc8W78TbvXobNwxbw6o9JRBeMmRXL8Izf1j1n3OF
         4dOg==
X-Forwarded-Encrypted: i=1; AL+hErG7O1+oi1rMrI4uDp7dQddC167WkOsVOo9FcwI7bM+HRJjTH3MMRG0nEvlrLFs4TslG+Q82Q5T7rjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zuFnmXZ3LRnvm3tFfdzsYpHnY9coQjYMFkYffUTw0Sh8JiyYS
	8IGzdBTyRagQAiBkV1OqwIFIpujItHGpux/ZoKmh499XH2w+PKFlmO+k
X-Gm-Gg: AZFdTZfj/a6ybnSRzHGglw9Np0bClRpOXlJPKpG/PRm8+8MzEkxY8Fu6k4drv1pI2L9
	NInsBQZXt3ct+epNQYrcxGmPD8GQ+Azue1SpF3UkEDbGN6qekcrrKj43chPiDDq1QPwrJEDtX8e
	LYHTLuzo8WPtH2othSNMWuM0Udk/e2yms9zUFQ6OA5gMKIexv2SnUi7gUPW9h34FLW1T8aHqWnb
	H5tvaiFKXOOfOowQeuI8r4hIZUWei+2f+Yxg0w/7Nqc/lE3niFg1cxZx+LM4lcueuQ7sWq06hh0
	/cJXZ/76rZ2tLGUlL2ousnsmnxipyEDBA6+hXMC/wB6VGu9lZn3KtjsOFAd971QBg+K3WHeJVsb
	RZv1PVruD1vOBH23zA74k0eioWGiy0Sqgd1ccuWre+zLJVr+1S5rgd5CUwI1O13kUSGgGpPOxoY
	HP6s6fpv8PpxRTNGPzzoUlRYwbsKJta4GQHOEauhWAYA1j2L+pfhhImoDOe4tqSiHLwM9EXT7bl
	v4i3p6YeAdujE7aTKtP986P2UIePfd6beYU/h1TgnHuKnLn9CjI6n8DwTA7xascZch5JAQPUBJK
	7mDAtTZkKybQf0QFtdJujLQ=
X-Received: by 2002:a05:7300:d583:b0:384:d6eb:ec7c with SMTP id 5a478bee46e88-384d6ebf259mr2588423eec.22.1795134722796;
        Thu, 19 Nov 2026 16:32:02 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:67::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385616f0a3fsm2195980eec.0.2026.11.19.16.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:32:02 -0800 (PST)
Date: Thu, 19 Nov 2026 16:31:55 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Duyck <alexanderduyck@fb.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, kernel-team@meta.com, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>
Subject: Re: [PATCH net-next 7/7] selftests: net: Test XDP on io_uring RX
Message-ID: <av-Udp0GfOjxH9vq@devvm16445.scu0.facebook.com>
References: <20261117164700.2157816-1-bjorn@kernel.org>
 <20261117164700.2157816-8-bjorn@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117164700.2157816-8-bjorn@kernel.org>

On 11/17, Björn Töpel wrote:
> Native XDP must not access io_uring payload through normal packet
> helpers. Compare ordinary page-backed RX with an io_uring RX queue.
> Check header, fragment and boundary access, and verify the received
> bytes through recv() and RECV_ZC.
> 
> Probe support by binding io_uring first and attaching a frags-aware
> XDP_PASS program. Skip unsupported combinations, but fail later
> attach, verifier and data-path checks. Require non-linear packets on
> the selected queue. Use XDP links so the test cannot replace another
> program, and restore header split, RSS and the flow rule.
> 
> An AI review found that ignoring io_uring setup errors could turn them
> into capability skips. A process-local seccomp filter returning EPERM
> reproduced this. The new XDP test now treats setup errors as failures.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> ---
>  MAINTAINERS                                   |   2 +
>  .../selftests/drivers/net/hw/.gitignore       |   1 +
>  .../testing/selftests/drivers/net/hw/Makefile |  10 +-
>  tools/testing/selftests/drivers/net/hw/config |   5 +
>  .../selftests/drivers/net/hw/iou-zcrx.c       | 242 +++++++++++++++++-
>  .../selftests/drivers/net/hw/iou-zcrx.py      | 108 +++++++-
>  .../selftests/drivers/net/hw/iou_zcrx.bpf.c   | 111 ++++++++
>  .../selftests/drivers/net/hw/iou_zcrx.h       |  34 +++
>  8 files changed, 492 insertions(+), 21 deletions(-)
>  create mode 100644 tools/testing/selftests/drivers/net/hw/iou_zcrx.bpf.c
>  create mode 100644 tools/testing/selftests/drivers/net/hw/iou_zcrx.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 32e218c0fe68..ea383dd81668 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14076,6 +14076,8 @@ T:	git https://github.com/isilence/linux.git zcrx/for-next
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git
>  S:	Maintained
>  F:	io_uring/zcrx.*
> +F:	tools/testing/selftests/drivers/net/hw/iou-zcrx.*
> +F:	tools/testing/selftests/drivers/net/hw/iou_zcrx.*
>  
>  IO_URING BPF-OPS
>  M:	Pavel Begunkov <asml.silence@gmail.com>
> diff --git a/tools/testing/selftests/drivers/net/hw/.gitignore b/tools/testing/selftests/drivers/net/hw/.gitignore
> index 911a9bfeaf41..085aa8b17afc 100644
> --- a/tools/testing/selftests/drivers/net/hw/.gitignore
> +++ b/tools/testing/selftests/drivers/net/hw/.gitignore
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  iou-zcrx
> +iou_zcrx.skel.h
>  ncdevmem
>  tls_hw_offload
>  toeplitz
> diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
> index 429cb545a4f0..d7a1fea08ea7 100644
> --- a/tools/testing/selftests/drivers/net/hw/Makefile
> +++ b/tools/testing/selftests/drivers/net/hw/Makefile
> @@ -10,7 +10,8 @@ HAS_IOURING_ZCRX := $(shell \
>  	echo -e '#include <liburing.h>\n' \
>  	     'void *func = (void *)io_uring_register_ifq;\n' \
>  	     'int main() {return 0;}' | \
> -	$(CC) -luring -x c - -o /dev/null 2>&1 && echo y)
> +	$(CC) $(CFLAGS) $(CPPFLAGS) $(USERCFLAGS) $(LDFLAGS) \
> +	$(USERLDFLAGS) -x c - -o /dev/null -luring 2>&1 && echo y)
>  
>  ifeq ($(HAS_IOURING_ZCRX),y)
>  COND_GEN_FILES += iou-zcrx
> @@ -98,5 +99,10 @@ include ../../../net/ynl.mk
>  include ../../../net/bpf.mk
>  
>  ifeq ($(HAS_IOURING_ZCRX),y)
> -$(OUTPUT)/iou-zcrx: LDLIBS += -luring -lpthread
> +$(OUTPUT)/iou-zcrx: CFLAGS += -I$(OUTPUT) -I$(SCRATCH_DIR)/include
> +$(OUTPUT)/iou-zcrx: LDLIBS += -luring -lpthread -lelf -lz
> +$(OUTPUT)/iou-zcrx: LOCAL_HDRS += iou_zcrx.h $(OUTPUT)/iou_zcrx.skel.h
> +$(OUTPUT)/iou-zcrx: iou_zcrx.h $(OUTPUT)/iou_zcrx.skel.h $(BPFOBJ)
>  endif
> +
> +$(OUTPUT)/iou_zcrx.bpf.o: iou_zcrx.h $(selfdir)/bpf/bpf_kfuncs.h
> diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
> index 081155bf7847..ef77543b567f 100644
> --- a/tools/testing/selftests/drivers/net/hw/config
> +++ b/tools/testing/selftests/drivers/net/hw/config
> @@ -1,4 +1,6 @@
> +CONFIG_BPF_JIT=y
>  CONFIG_BPF_SYSCALL=y
> +CONFIG_DEBUG_INFO_BTF=y
>  CONFIG_FAIL_FUNCTION=y
>  CONFIG_FAULT_INJECTION=y
>  CONFIG_FAULT_INJECTION_DEBUG_FS=y
> @@ -9,6 +11,7 @@ CONFIG_INET6_ESP_OFFLOAD=y
>  CONFIG_INET_ESP=y
>  CONFIG_INET_ESP_OFFLOAD=y
>  CONFIG_IO_URING=y
> +CONFIG_IO_URING_ZCRX=y
>  CONFIG_IPV6=y
>  CONFIG_IPV6_GRE=y
>  CONFIG_IPV6_SIT=y
> @@ -20,7 +23,9 @@ CONFIG_NET_IPGRE=y
>  CONFIG_NET_IPGRE_DEMUX=y
>  CONFIG_NET_IPIP=y
>  CONFIG_NETKIT=y
> +CONFIG_NET_RX_BUSY_POLL=y
>  CONFIG_NET_SCH_INGRESS=y
> +CONFIG_PAGE_POOL=y
>  CONFIG_SYNC_FILE=y
>  CONFIG_TLS=y
>  CONFIG_TLS_DEVICE=y
> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> index 91b025a8771e..f7e909fd6840 100644
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> @@ -16,6 +16,7 @@
>  #include <linux/mman.h>
>  #include <linux/errqueue.h>
>  #include <linux/if_packet.h>
> +#include <linux/if_link.h>
>  #include <linux/ipv6.h>
>  #include <linux/socket.h>
>  #include <linux/sockios.h>
> @@ -37,9 +38,13 @@
>  #include <sys/un.h>
>  #include <sys/wait.h>
>  
> +#include <bpf/bpf.h>
>  #include <liburing.h>
>  #include <ynl.h>
> +#include "kselftest.h"
>  #include "netdev-user.h"
> +#include "iou_zcrx.h"
> +#include "iou_zcrx.skel.h"
>  
>  #define SKIP_CODE	42
>  
> @@ -89,7 +94,11 @@ static struct sockaddr_in6 cfg_addr;
>  static unsigned int cfg_rx_buf_len;
>  static bool cfg_dry_run;
>  static int cfg_num_threads = 1;
> +static bool cfg_xdp;
> +static bool cfg_pages;
>  
> +static struct iou_zcrx *xdp_skel;
> +static int xdp_link = -1;
>  static char *payload;
>  
>  #define MAX_CONNS_PER_THREAD	64
> @@ -154,6 +163,139 @@ static inline size_t get_refill_ring_size(unsigned int rq_entries)
>  	return ALIGN_UP(size, page_size);
>  }
>  
> +static int probe_xdp(void)
> +{
> +	const struct bpf_insn insns[] = {
> +		{
> +			.code = BPF_ALU64 | BPF_MOV | BPF_K,
> +			.dst_reg = BPF_REG_0,
> +			.imm = XDP_PASS,
> +		},
> +		{ .code = BPF_JMP | BPF_EXIT },
> +	};
> +	LIBBPF_OPTS(bpf_prog_load_opts, load_opts,
> +		    .prog_flags = BPF_F_XDP_HAS_FRAGS);
> +	LIBBPF_OPTS(bpf_link_create_opts, link_opts,
> +		    .flags = XDP_FLAGS_DRV_MODE);
> +	unsigned int ifindex;
> +	int prog_fd, link_fd;
> +
> +	ifindex = if_nametoindex(cfg_ifname);
> +	if (!ifindex) {
> +		error(0, errno, "if_nametoindex()");
> +		return EXIT_FAILURE;
> +	}
> +	prog_fd = bpf_prog_load(BPF_PROG_TYPE_XDP, "zcrx_probe", "GPL",
> +				insns, ARRAY_SIZE(insns), &load_opts);
> +	if (prog_fd < 0) {
> +		error(0, -prog_fd, "load XDP probe");
> +		return EXIT_FAILURE;
> +	}
> +
> +	/* The io_uring queue is already registered; never replace a program. */
> +	link_fd = bpf_link_create(prog_fd, ifindex, BPF_XDP, &link_opts);
> +	close(prog_fd);
> +	if (link_fd >= 0) {
> +		close(link_fd);
> +		return 0;
> +	}
> +	if (link_fd == -EBUSY || link_fd == -EOPNOTSUPP) {
> +		printf("Native XDP with ZCRX is not supported: %s\n",
> +		       strerror(-link_fd));
> +		return SKIP_CODE;
> +	}
> +	error(0, -link_fd, "attach XDP probe");
> +	return EXIT_FAILURE;
> +}
> +
> +static void setup_xdp(void)
> +{
> +	LIBBPF_OPTS(bpf_link_create_opts, opts,
> +		    .flags = XDP_FLAGS_DRV_MODE);
> +	unsigned int ifindex;
> +	int prog_fd;
> +
> +	ifindex = if_nametoindex(cfg_ifname);
> +	if (!ifindex)
> +		error(1, errno, "if_nametoindex()");
> +	xdp_skel = iou_zcrx__open();
> +	if (!xdp_skel)
> +		error(1, errno, "iou_zcrx__open()");
> +	xdp_skel->bss->port = cfg_port;
> +	xdp_skel->bss->queue_id = cfg_queue_id;
> +	xdp_skel->bss->unreadable = !cfg_pages;
> +	if (iou_zcrx__load(xdp_skel))
> +		error(1, errno, "iou_zcrx__load()");
> +
> +	/* A link cannot replace another program and closes with the process. */
> +	prog_fd = bpf_program__fd(xdp_skel->progs.iou_zcrx);
> +	xdp_link = bpf_link_create(prog_fd, ifindex, BPF_XDP, &opts);
> +	if (xdp_link < 0)
> +		error(1, errno, "attach native XDP");
> +}
> +
> +static void check_xdp(void)
> +{
> +	static const char * const locations[] = {
> +		"header", "fragment", "boundary",
> +	};
> +	static const char * const ops[] = {
> +		"load", "store", "dynptr read", "dynptr write",
> +		"slice", "slice rdwr",
> +	};
> +	struct xdp_zcrx_stats sum = {}, *all, *s;
> +	int ncpus, cpu, loc, op;
> +	__u32 key = 0;
> +	bool failed;
> +
> +	close(xdp_link);
> +	xdp_link = -1;
> +	ncpus = libbpf_num_possible_cpus();
> +	if (ncpus < 0)
> +		error(1, 0, "libbpf_num_possible_cpus(): %d", ncpus);
> +	all = calloc(ncpus, sizeof(*all));
> +	if (!all)
> +		error(1, errno, "calloc XDP statistics");
> +	if (bpf_map_lookup_elem(bpf_map__fd(xdp_skel->maps.stats), &key, all))
> +		error(1, errno, "read XDP statistics");
> +
> +	for (cpu = 0; cpu < ncpus; cpu++) {
> +		s = &all[cpu];
> +		sum.packets += s->packets;
> +		sum.tested += s->tested;
> +		sum.wrong_queue += s->wrong_queue;
> +		sum.bad_headers += s->bad_headers;
> +		sum.linear_bytes += s->linear_bytes;
> +		sum.frag_bytes += s->frag_bytes;
> +		for (loc = 0; loc < XDP_ZCRX_LOCATIONS; loc++) {
> +			for (op = 0; op < XDP_ZCRX_OPS; op++)
> +				sum.errors[loc][op] += s->errors[loc][op];
> +		}
> +	}
> +	free(all);
> +
> +	printf("XDP %s: queue=%d packets=%llu tested=%llu\n",
> +	       cfg_pages ? "pages" : "io_uring", cfg_queue_id,
> +	       sum.packets, sum.tested);
> +	printf("XDP geometry: linear=%llu frags=%llu\n",
> +	       sum.linear_bytes, sum.frag_bytes);
> +	printf("XDP errors: wrong_queue=%llu bad_headers=%llu\n",
> +	       sum.wrong_queue, sum.bad_headers);
> +	failed = !sum.tested || sum.wrong_queue || sum.bad_headers;
> +	for (loc = 0; loc < XDP_ZCRX_LOCATIONS; loc++) {
> +		for (op = 0; op < XDP_ZCRX_OPS; op++) {
> +			if (!sum.errors[loc][op])
> +				continue;
> +			fprintf(stderr, "%s %s: %llu failures\n",
> +				locations[loc], ops[op], sum.errors[loc][op]);
> +			failed = true;
> +		}
> +	}
> +	iou_zcrx__destroy(xdp_skel);
> +	if (failed)
> +		error(1, 0, "XDP access checks failed");
> +}
> +
>  static void setup_zcrx(struct thread_ctx *ctx)
>  {
>  	unsigned int rq_entries = AREA_SIZE / page_size;
> @@ -217,6 +359,10 @@ static void setup_zcrx(struct thread_ctx *ctx)
>  	};
>  
>  	ret = io_uring_register_ifq(&ctx->ring, (void *)&reg);
> +	if (cfg_xdp && cfg_dry_run && ret == -EOPNOTSUPP) {
> +		puts("Interface-bound ZCRX is not supported");
> +		exit(SKIP_CODE);
> +	}
>  	if (cfg_rx_buf_len && (ret == -EINVAL || ret == -EOPNOTSUPP ||
>  			       ret == -ERANGE)) {
>  		printf("Large chunks are not supported %i\n", ret);
> @@ -258,6 +404,34 @@ static void add_recvzc_oneshot(struct thread_ctx *ctx, int conn_idx, size_t len)
>  	sqe->user_data = conn_idx;
>  }
>  

[..]

> +static void verify_data(struct thread_ctx *ctx, int conn_idx,
> +			const char *data, size_t len)
> +{
> +	size_t offset = ctx->received[conn_idx];
> +	size_t i;
> +
> +	for (i = 0; i < len; i++) {
> +		if (data[i] != payload[offset + i])
> +			error(1, 0, "payload mismatch at %zu", i);
> +	}
> +	ctx->received[conn_idx] += len;
> +}

Move some of the refactoring/fixes out into a separate patch?

But in general feels like a wrong test to extend.. Why not call
ncdevmem somewhere in python wrapper (and attach xdp prog that you have
in this patch)? To decouple xdp testing from the entity that generates/receives
unreadable frags.
