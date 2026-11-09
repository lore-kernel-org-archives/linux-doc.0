Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239355;
	b=Vur6dSYq0E/F9abpOzh8qHm82K2YziWoY8h6AkmIWlNRDWtPqHne/HTq1oj6T+TAXPWk
	 NwalhXMgEsuDrzNOTwhrMjBBVHHB60Kea8qiEwv5D7T2u6uLAIRpwoE2tvKm0X5SSebBo
	 XA94LLPinyx+v5WpZLoS1EGIcjIMsfYDTlUH3VXc9ri3LJYL3mFXxuHO86lbKM4j6T+/b
	 +b1RIa+WjZIO/MNnouE7DgybymTzygouRKHH24hG5zlLTCUcmVGau/cezET/GzbfrpCgJ
	 eAIaHeEwidfYp1CZ6CAckpdpA0wipAcvrXYUwaek25Re/IzDQHxWggWWfhsWl0bA9xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YbLfW9U7bURTW7WWyEUs2jKzerBMtTsg+xvyertb1hc=;
	b=zl2yckESlwOtl+RIPS/yOCyuEpfxTy6y6y70Q+Im3ictjS2VpU2hgJrtr8ebECaSD/DQ
	 jE3ndyIBHNC3vU4ZkrrBBTgLYvgDlNj3vlnz2yhtApFFKjfcsCPk+3J6yYSIZeOXDVFYB
	 7HfPfVlR5iOkW9S15B+EQ8dXN4Y/od2BusazuIEU2FX5FBK9M5bw8GNu6/lePjf31Ie7w
	 GGxafUq6zhw9LENTZNdXiovxiPmg1YWrv0f9crqdngdRzjEDNpC2q+/IZ7P1CWkjgJSwj
	 4wZLJLJbl2Uv3SkTRBo5Zb1wzvN74Ys76hTzQZy7aAHZlf9IEG9QaB657PR9ZIYd57A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NgmDxAS1;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C9606A32A
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 15:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D88C9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NgmDxAS1
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso176756166b.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 07:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794239353; x=1794844153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YbLfW9U7bURTW7WWyEUs2jKzerBMtTsg+xvyertb1hc=;
        b=NgmDxAS1XReNTi/U/iDSh8mgdE/VoqW1kZ2zrt2gbEsPCn3AoOaYrbgL9tBQAZLMEg
         sV1TIQgRXFgzd1XPkVoMNWMz8rwtJgsCUJvrGIXSjJEsh2kAkWJWNGOMqn56aoS4OmA8
         lpwqWCOhQBlb9P7N5tlRhT4FVaxsJECMGhHakqy/9NLArjfFFim4/6V3tlgq5sWA5cwL
         xIK6pjqBvc+iI/Fxmm2zbJb8gixcmt4FLLxfXebAgJBtVqdpAQYe9yFNrmVh/GaOD0mh
         mXtE4u5A8ZUk9XtmUFwyDlF2ztOVWC3Id4wBEKb7x8CsvaLz3kNnOz5wMXICrpr/rXZk
         tahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239353; x=1794844153;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbLfW9U7bURTW7WWyEUs2jKzerBMtTsg+xvyertb1hc=;
        b=I/YgRgzl1ufnJ7CNanncKrMdIfunT3sXYRptm+v8UaAudpn2jQ5snirCSUWtP7vAD2
         SvTDfOLz6G7DRR2PyLd7ON3W3DalllEa2Q+Y14emTQ+9ki1LDp2xRKEXCCCSg67qoBwU
         ZuUyfKr5hfSbVlEjH5j88b2KcMF+5uHfHRi9toS+F0mlScEya9DTRuSFpRdp74aEx38o
         wiVguk7Hoo4TYa4ilkAq6gOoda/zw+olBMj3v6TdoEkjmAC4ppgszw9NxdSeKQmusnRa
         x9RmwgZertw8QZba+AfiGpl0QSwKmOA0KklfmkmPnVZ/YzJYWQEZc4mlNI6A4AP8PLNw
         MDMg==
X-Forwarded-Encrypted: i=1; AL+hErEYyV4nX0hoYQg6/rVu3nOytjDJpqi7OytUc71lMe/+RsFFHOyA0bH25EOvmBHFKpbGQrmdBFOyLf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z85dJ64+w/d/ZB+OH5nB+xjGZv4QP4iwZRIneD/VAy4tpiAbqsv
	E8dwj+/3r1SkbFM7OCAuXqhnG1CezI7NNtuyAgU5o5N2rwYdSZIEXQ/Qpa/CNRRf2WE=
X-Gm-Gg: AYBFou1mvpe/VBoEf1pq2/ksZnRSYak2+tAA1ZQ9EnLxSXKERdsBHmjgwaJA6p3i6/E
	h177iKhcHLaKSVx7C2b1ewYwqSvslpBzfW1pgItMTZHwxbibGs+5wxNLuEv0BdSSExea+SBVODP
	x+UXhK/RcHAja2ocMiqqsSkJJvhfjRAlKdAYYtTnG83fH5NzYaxUZ1fVQQfGBdprrfix33/M3h1
	FisxZlZ8EXbGkqwNhS6sM5jbNMRN0ErcSjsrhcQnnoYAgl5hC542B6nDGh16wsUCIR5M/pd4pFu
	8TGXY3YGkWw0Qgz8DAZZacY8aYsaTnXEVPEBUr9OJH0l2RLM7ip+ha2pSkk40tXp/SeBirW1QAy
	IDKTo+xZi6SqbrTnPOnoulOxpZLzKGFA9iR7Z02k29zchkxgljEONu21AAWFZQG84fA+zixkyoc
	mBxEZ6zVjrGnwHRZBaCpHzOd8TATosy8U9f1R8WrjIoGt0I8r4tq9SyEBUogx1gS7wDD79bZyJn
	yNAXMiuekhFfx8dHIzgQV5quGyCO1rshvGm4pf0yfoR2/O9aBqJ1yrJcuc2gXzWSfpoLsCyeYF7
	oVopZo+g8beTHW6f3J273MZwZ8esTQm/C2RGRImaUnptNlE=
X-Received: by 2002:a17:907:e8e:b0:c2e:8eb7:53dd with SMTP id a640c23a62f3a-c4d6d82594cmr350173866b.42.1794239353250;
        Mon, 09 Nov 2026 07:49:13 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9990besm179938866b.70.2026.11.09.07.49.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 07:49:12 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and LL_ALLOC_SPACE()
Date: Mon,  9 Nov 2026 15:49:09 +0000
Message-ID: <20261109154909.32748-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108190831.3f991a13@phoenix.local>
References: <cover.1794020868.git.tianyi@cloudflare.com> <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com> <willemdebruijn.kernel.1d64e7848503b@gmail.com> <20261107182526.69543-1-tianyi@cloudflare.com> <willemdebruijn.kernel.2c6a653eb65fa@gmail.com> <20261108190831.3f991a13@phoenix.local>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi Stephen,

Thanks for the invaluable and detailed review.

On Sun, 8 Nov 2026 19:08:31 -0800, Stephen Hemminger wrote:
> Since the motivating case is XDP, the mechanism should let the XDP program
> ask for the padding it needs, rather than making the operator translate
> the program's requirement into a device setting by hand.

The series started from David Keogh's TC egress case, as described in
the RFC [1] and in the first paragraph of the v1 cover letter. The veth
XDP case came later, when I found that the same field also avoids the
copy for generic XDP on veth.

> Your own reply already works this out:
>
> > - XDP on a veth peer: veth_xdp_set() and generic_xdp_install() can
> >   increase the headroom of the peer to XDP_PACKET_HEADROOM on attach
> >   and reset it on detach.
>
> That is the mechanism, and it needs no uapi, no operator arithmetic, and
> no stale state. I would rather see it implemented for the cases it covers
> than add a permanent uapi that removes the incentive to do so.

Agreed. For this case, I plan to move to this in v2. When an XDP program
is attached to a veth device, tx_extra_headroom of the peer is set to
XDP_PACKET_HEADROOM.

> On the argument that program-side declaration is itself new uapi, and that
> the labeled device is often not the device the skb was allocated on:
> granted for the general TC egress case.

For TC egress, the kernel does not know at attach time how many bytes
the program pushes. Only the program, or the software that loads it,
knows. Attach-time propagation works for XDP because XDP_PACKET_HEADROOM
is a fixed value.

Since we both agree that auto-tuning has real problems, a narrow UAPI,
such as a BPF-side declaration, seems unavoidable for TC egress. The
program declares the headroom that it needs through this UAPI. The
initial plan is a BTF decl_tag, as Dragos Tatulea suggested on the RFC
[2]. On attach, the kernel increases tx_extra_headroom of the device
that the program is attached to.

> Which leaves the genuinely hard case, the one you describe at Cloudflare: a
> service in a netns sends through a veth pair, the host forwards to the
> uplink, and a TC egress program there encapsulates, after ip_rcv_core()
> has orphaned the skb so the allocating device cannot be identified. If
> that is the real residue, make it the problem being solved and argue for
> the narrowest mechanism that solves it.

This case only came up after I started to look at in-kernel approaches,
because the general IFLA_TX_EXTRA_HEADROOM UAPI already solves it. It is
not a new case, and it is not uncommon. Cilium, Flannel and Calico use a
tunnel by default [3][4][5], so the device that encapsulates is not the
device that allocated the skb.

netkit already has a similar UAPI. Commit b9ed315d3c4c ("netkit: Allow
for configuring needed_{head,tail}room") [6] by Daniel Borkmann added
IFLA_NETKIT_HEADROOM for Cilium in VXLAN or Geneve tunneling mode. As
you point out, the value can go stale. But the CNI plugin sets it when
it creates the device, as Cilium does for netkit.

As far as I can see, a narrow UAPI, such as a veth attribute
VETH_INFO_TX_EXTRA_HEADROOM, is unavoidable for this case.

> As posted, the series leads with
> cases that in-kernel propagation handles and uses them to justify an
> interface sized for the case it does not.

Based on what I have learned from both of you, this is my plan for v2:

- Drop IFLA_TX_EXTRA_HEADROOM.
- Keep 1/8 and 2/8, i.e. tx_extra_headroom, as an in-kernel field. It is
  needed to avoid a perf regression if we just use needed_headroom. It
  is needed in all three cases below.
- veth XDP: set on attach as described above.
- TC egress on the device that allocates the skb: the BTF decl_tag UAPI
  described above.
- Cross-device encapsulation: the veth attribute
  VETH_INFO_TX_EXTRA_HEADROOM UAPI described above. I will rework the
  existing iproute2 series [7] to set this attribute, and post it
  together with v2.

This would introduce two narrow UAPIs instead of one generic UAPI.
Please let me know if everyone is happy with this new plan. If there are
no objections, I will proceed with v2 following this plan. I am happy to
change it if there is a better solution for these cases.

To David Keogh: this plan drops the generic device attribute UAPI that
your RFC proposed. Your TC egress use case stays in v2, with a BPF-side
declaration instead of the device attribute. Before I proceed, please
let me know if you are unhappy with this plan.

Thanks,
Tianyi

[1] https://lore.kernel.org/all/20261015235335.4162993-1-dkeogh@amazon.com/
[2] https://lore.kernel.org/all/bba453eb-769e-458b-88f7-8cc9bcafc1db@nvidia.com/
[3] Cilium, veth with VXLAN by default:
    https://github.com/cilium/cilium/blob/main/pkg/defaults/defaults.go
[4] Flannel, VXLAN by default:
    https://github.com/flannel-io/flannel/blob/master/Documentation/kube-flannel.yml
[5] Calico, IPIP by default:
    https://github.com/projectcalico/calico/blob/master/manifests/calico.yaml
[6] https://git.kernel.org/torvalds/c/b9ed315d3c4c
[7] https://lore.kernel.org/all/cover.1794022936.git.tianyi@cloudflare.com/
