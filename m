Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8573911CE
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 19:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784575982; cv=none; b=Jn5pbbWfyF/ZYNrLL2RFIEH9WtVHOtjc4sCNB8w4Wq0CFr51uHYc/2Lf9RlnSpVH0NAJia2vheCa6lZAXnwEFvlnQxjEKPlm4g1L72HBhDeIHWZxsTa2KIY2HbNlwp+4sGDvulamJihjjkpyoQppH14MUCT5s8gevQ7fsfLTpt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784575982; c=relaxed/simple;
	bh=wR02Cf1ZX0VxOSrwhtcrXjbKc2v02WfoOYRrstsXQbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNuJ19NizZMaL8Lap0mIkoMcbkQPQlk4lp+6rPClFdzlXcX0LrdbFeHhnPpa9uWJHmX5apWqEQUeEtxJoAbJAEWJgSICk4cGkinQnSAA1s0Hniis5yt6kNMgNbf3a/c5CktoVEB6rmbCM5WvO1RRCCJiaExeuWueNxZ/wGdIwGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1TZ+ycx; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1TZ+ycx"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca696c4b152so2977716a12.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 12:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784575981; x=1785180781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mipM1cLecOb4t56l8llNyfwcJ8p4RmBXYxGw64Z8Tfc=;
        b=I1TZ+ycxbpyyXGJLMFWGl1RgYivyDJZ11FFcjm6IeJurLlhNEWR1b1+bzGep9Sug2v
         +yAECG9JW3itKU7OAiFz9cQv46LCfaGRBkWGHeXRonrsOjdPUn7nmmj4Qty4pUfQhQSW
         4F3XxVnmtuQMuQ5vvZGHmE04WYnZ/NKrifx1bkq4TY8tE1qpdv2g80uZRIqzJP4VbD/s
         wjHHKaV0nhtHHNtVKrFt33dpf2OmXbc9pSE0BRICMAha5qP+SsqIJq0AcBDYlAZKcu4G
         GLOThzFDFI+u8tknZ7JhCd7q2HsyhTD2iiq31B/6F5jVVXsfApbndwstTtDkfxNocIJR
         5Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784575981; x=1785180781;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mipM1cLecOb4t56l8llNyfwcJ8p4RmBXYxGw64Z8Tfc=;
        b=sv7aGZYd5xhZm4wJmGISutvxEfMxJrgo9ehsmfitBgWhqsCXiCjyAjHjmN7PcSzuX3
         61gFakcTg6cPtMOGWzWNj6+6YTYZEkvrQ+Q4z2XK8SJyfSkmuEIbSkvffgrWWGiE+9dP
         GaVX2HQA0nf5E2nu6LdQG3CspETiGTW9JEdks/HOEYby4hxUjAuP13rJOHuLiooSdKFP
         rTn5fEA+iA0SqJu2todu1SApCe1Wujs3XO94ulnjWUkf0qz5WeZ5nqxWVKPQXCPxOG7E
         h4iuV/8uioLl6OvLX+ZZjH5SzKNFtIKQ8mZjM/c71CXuZ2QjW1diRhEQ2hlLP5vNW6R1
         ywAg==
X-Forwarded-Encrypted: i=1; AHgh+Rr97DDcojO1vOGChu5QDw2si+FQU8iWau0Ko3jK2zzX41Obexe+3hO7n90Pnxsuqwx+YmzWFBM5sYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMpSYiTTBlSru7kx6iXo5L/kkzRU7e1H1hv+tO1iNZW63T12xO
	IyzGUp4Btm+BhfBURXVnTURlP5hQrNmKft64zxYKCrL4pDOE2K3mpmRA
X-Gm-Gg: AfdE7clinNPV+/d7ruODrLZzdxpGyZhpWtEOc0QWP92eI+yg0f9wl8Ce0DHxnUmnVIy
	g4nYzBBZw4XWuvG7zhktlX8xP+oVKZjkupeX3xpgTnGilNlJPwhy7P77EGfUdCXvVYiMSCjsPx9
	FLalooUz9FXTLCvZwvCzF647IeEzP6TbcEL6O0Kcy7mhU9vgzk0xf7eW9eZ4gG+YDZCahTFIPMj
	d1mMnaugUVSphAomADatzXIhU97F8lnJ9TPMFtLK6O/o2Fs1Db/xiJqHKTnAJz24OMr/AifJL+J
	eqFdcvyqzA3Ze0WEY3q61TKUB8IDK8UoiZ7TKI48bsejYBb5I0Ac3YFOR31mwfkNgXIej6CxoeG
	t/pMsUhYXYfl+mjexhVLEyXaaXaCglvtp194BHoyQv4kLOCLKEHDgOnx8BPL28LqryxX0EA==
X-Received: by 2002:a05:6a00:80a:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84c2922630cmr15623327b3a.16.1784575980551;
        Mon, 20 Jul 2026 12:33:00 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:1::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2f1601d6sm5999817b3a.50.2026.07.20.12.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:33:00 -0700 (PDT)
Date: Mon, 20 Jul 2026 12:32:55 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Vladimir Vdovin <deliran@verdict.gg>, 
	Jakub Sitnicki <jakub@cloudflare.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next v5 8/8] selftests: net: add test for XDP_PASS
 skb checksum invalidation
Message-ID: <al53WS9FMTnu7tBI@devvm7509.cco0.facebook.com>
References: <20260715-bpf-xdp-meta-rxcksum-v5-0-623d5c0d0ab7@kernel.org>
 <20260715-bpf-xdp-meta-rxcksum-v5-8-623d5c0d0ab7@kernel.org>
 <aljNR2sf8qJVKFgb@devvm7509.cco0.facebook.com>
 <alkBnI3XcH0XGjEo@lore-desk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alkBnI3XcH0XGjEo@lore-desk>

On 07/16, Lorenzo Bianconi wrote:
> On Jul 16, Stanislav Fomichev wrote:
> > On 07/15, Lorenzo Bianconi wrote:
> > > Add a test that verifies skb->ip_summed is set to CHECKSUM_NONE
> > > when a device running in XDP mode creates an skb from a xdp_buff
> > > if the attached ebpf program returns an XDP_PASS.
> > > The test attaches an XDP program returning XDP_PASS, and a TC
> > > ingress program that runs the bpf_skb_rx_checksum() kfunc to
> > > inspect the resulting skb. After XDP_PASS the driver must invalidate
> > > any previously computed hardware RX checksum since XDP may have
> > > modified the packet data.
> > > The BPF program counts packets per checksum type in a map, and the
> > > test runner verifies that after sending traffic the CHECKSUM_NONE
> > > counter is non-zero while CHECKSUM_UNNECESSARY and CHECKSUM_COMPLETE
> > > counters are zero.
> > > 
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  Documentation/networking/xdp-rx-metadata.rst       |  5 ++
> > >  .../selftests/drivers/net/hw/xdp_metadata.py       | 55 +++++++++++++++-
> > >  .../selftests/net/lib/skb_metadata_csum.bpf.c      | 73 ++++++++++++++++++++++
> > >  3 files changed, 132 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/networking/xdp-rx-metadata.rst b/Documentation/networking/xdp-rx-metadata.rst
> > > index 93918b3769a3..7434ac98242a 100644
> > > --- a/Documentation/networking/xdp-rx-metadata.rst
> > > +++ b/Documentation/networking/xdp-rx-metadata.rst
> > > @@ -90,6 +90,11 @@ conversion, and the XDP metadata is not used by the kernel when building
> > >  ``skbs``. However, TC-BPF programs can access the XDP metadata area using
> > >  the ``data_meta`` pointer.
> > 
> > [..]
> > 
> > > +If a driver is running in XDP mode, any existing hardware RX checksum
> > > +(``CHECKSUM_UNNECESSARY`` or ``CHECKSUM_COMPLETE``) must be invalidated
> > > +by setting ``skb->ip_summed`` to ``CHECKSUM_NONE`` before passing the
> > > +skb to the kernel, since XDP may have modified the packet data.
> > > +
> > >  In the future, we'd like to support a case where an XDP program
> > >  can override some of the metadata used for building ``skbs``.
> > 
> > Sorry for keeping nitpicking on this, but I'm still not convinced that
> > it is what we currently do. From my previous reply:
> 
> no worries :)
> My current take-away from the previous discussion is we just need to document
> what would be the driver expected behaviour adding a kselftest for it (without
> modifying any driver).
> 
> > 
> > > > Looking at a few drivers:
> > > > - bnxt (bnxt_rx_pkt) does UNNECESSARY - ok
> > > > - mlx5 (mlx5e_handle_csum) does UNNECESSARY and skips COMPLETE if there is
> > > >   bpf prog attached
> > > > - fbnic (fbnic_rx_csum) - can do COMPLETE even with xdp attached?
> > > > - gve (gve_rx) - can do COMPLETE even with xdp attached?
> > 
> > (although for gve I might be wrong, there is also gve_rx_skb_csum that only
> > does UNNECESSARY).
> > 
> > I'd wait for Jakub to chime in, but it feels like we should just document
> > what we currently do as a recommended approach: for the drivers
> > that support COMPLETE, do not report it when the bpf program is attached.
> > Both NONE and UNNECESSARY are ok.
> 
> I am not completely sure the UNNECESSARY case is different from the COMPLETE
> one. What are we supposed to do if the driver reports UNNECESSARY and the ebpf
> program modifies some fields covered by the rx-checksum?

For unnecessary, I think the safe expectation is that the bpf program
will update the value of the checksum in the packet if it touches the data?

> > Also, did you run this test on real HW? NIPA now has HW tests, maybe it
> > makes sense to route this series via net-next to get the real coverage?
> 
> What about splitting this series and have two different series:
> - bpf-next: add xdp rx kfunc and related selftest
> - net-next: add kselftest for the driver expected behaviour.
> 
> What do you think?

I'd post everything to net-next to get the HW coverage. Once you get all
the acks we can ask the maintainers' guidance.
