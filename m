Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423678;
	b=3znAAUBdzQxVyh2EPk+2i3ry95pjxpjp2sE2HLkbPDO2Thh7Rjb1lckPK+RnVwf+HE93
	 uueZxUAQk7n7+2wcWeRjY2K51EL80K4egdIBx/TOzxc37hSvnLTWZqDJdG3H5LFPewUL1
	 hg0Zo3dMUQz3JSrDsCPpPnnm4eMupokrOl90ZwVNrpoX0CxZeJney6MTdA9tZS+wna/0L
	 oNpNlRGkGPfZUfO1ESGTK+FnnkSE3+ivIPWvMwo2nCjr91zxT0MwP+YVpceDgx+DjBy9g
	 quRSJsf65KuqisFRnCSGKQ/LGahnmSH8ur3NKGdUY9BPZf4A01TmF1lZzZFCWchcTAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=3mcdsvysa9luSuezEbeTLmuh15u7mjwAepQLZ7oOKD4=;
	b=2Qg6PlLkO2k9oolw5doUmnO6nU6Qnv62kd7VYui2tq/s7YpsAWUUtTKHwgg1knDBEG/Y
	 3GYRO+F0idBhXZgI2NLvIz5L+/3EaVb77tvWppia0jZCSJpbxcKsKpG1kfoq5yAkMpE/W
	 qG3iGxpikvUDQhAcV5GKANJjvQlNbx+0MVOd0BJ+r7j3zhzYfOMkzC7zA8VyNMcH2FklC
	 o6HgvdvNTTlNuex9/tXFBPGMt+LlSXPy5KrcPehY/KVlSj20UqeslGse2l2wuk7kWWsrQ
	 wZSbPCE1LTaVvknF2D0a5krRzCGpEIY2xulIuITdjP7v+Bg7uiawAkB8s1bRR9T73hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHkRigWs;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DBA606A32A
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 19:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49DBA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHkRigWs
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f1cf92c9eso337138085a.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 11:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423677; x=1795028477; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3mcdsvysa9luSuezEbeTLmuh15u7mjwAepQLZ7oOKD4=;
        b=LHkRigWscoO1IXIQFs6/S7w1FUhRnu66lP+me1F9tp+woQK1t61v4UNNSyggqb4mOX
         hkOb5/IVXmfs4ZveeHLDMgbH2NVuzIEY/J/WPy/shFxDKAiXJz6IbXyPUV4ckFZ+CsC+
         c9gkmXH6qx8NuT+7knfat6nN41LKdJI5AqHmXOuhg18s+O76DdTa+1UL8roEbcvId/Ns
         kTG/VWDpa7xwT+xoPmwPqh3uf6iTwuE9zBLajqn7CgcAuA/eMNIzXPPLnoO373jqfflo
         BWXGJsKWiNERilvEBM6NM78A4lF9eT8HO6VECVYKCKap11URDX6Ewiu7J/Bp2B4VyeQc
         r7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423677; x=1795028477;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mcdsvysa9luSuezEbeTLmuh15u7mjwAepQLZ7oOKD4=;
        b=jDkg2P8ukqwNwWqCjWopfJCRJwsA/4sKguOtscUCQaing2rHy9zNghz0VTG/q0Qgzl
         FhRnnkJ56PphN2jUuFLf+k8VHHQV0HXfmSaXu7zL21g07Q4cwuA59x+EwVQnJcsWtAOH
         EGjFqwPdB0G7Wpvsf9cSIm0+fNe9hGtvq9vokrAGpdwtKTaENqOHOSWoMltSgA4jVLlk
         IHMNzzh6scHhsnsGo2tRvOFidi3Bn0ZJlQvdYxpda9jkfTuhZp20c5QOu87SdcUj2/fu
         isUW2zUPqkjyzsuIEKQZtKwjZczmfxi8FEXZ4x3heFPIkKsglQB1VqwybfYdXPY9AYZv
         6yqw==
X-Forwarded-Encrypted: i=1; AL+hErHCYWkFAufUnZ4t16xdE3jkUTXlZhzeVpWydd3o6H6bsghlt/dqXDJB8rmJIoym+PMBUgRrQacLg4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NHzhn278eNgKO/JjVtvv0rHrAAg3kekm5Q/4iBIEajuTdQkS8
	eW4uiT6ZzGNnP7xHpXDxTZgR5NEtZUPzNJVN6GwOdK4TcMvZaGX4QrxA
X-Gm-Gg: AYBFou0XDk+JsLBCgOjl6Zl981N8D1ZxxTzZNsxY2QFpYF/Nyb/0IPuajYZRQuFugZ3
	Dm5Ei6U3oftfce+rZVNFajanznM9JnsIvwKsTKYVUj+qEqyNVTs5GJvcEsywi2Mj5inEbQrxhdF
	rnBGz4k8r5ZlKBBVrFtWPD6ah0Lb9VUm9AXJtDBag3nct+754wBQ6rBZDGPAdV3omACtNpafNAC
	9dBqERIF1mjeJ79189qPDP+/SPBIzg6WINgw8fnUlNqTwRjd1ePfDMqXBeDFyccYev5UstN4Nq7
	NQ4CwB2RBa55mBPo0f5WnNWIXdaVJdxV27GCNFlJakLK3F3OvJKQ7wfT/Em58yj2DDOE7FtD6+A
	kkesTi1MMJ/SC4/SU9kCiL+WxEflSsSg7EYKa8Bni3C3KBSi0fI9ntBEVLeiW1BNF5fprKg9Yuf
	U5dmxAzrufDrsrGmLInCJezHniSH1sMlCAulUzPoCqh49zJE3A0UDW1JX+lXCVJfZVrArlK66uv
	/vE7hJtVaIBoS+L8qYL3GkL6IS7sWoPN9xwO96EypYBtWSciv5vq0njjFNvVQldxRmutkwNXwyd
	w01SwYNBBP8hgTFlNbaCSHdELJ4MWh33BhwsGuiFhYWrbF403iLlJic=
X-Received: by 2002:a05:620a:2b96:b0:93f:53d1:54c7 with SMTP id af79cd13be357-947b00d141dmr521152085a.70.1794423676923;
        Wed, 11 Nov 2026 11:01:16 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm545314185a.10.2026.11.11.11.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:01:15 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 14:01:14 -0500
Message-Id: <DMSM3RNRY412.1GXB07F4KGJYR@gmail.com>
Cc: <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Donald Hunter" <donald.hunter@gmail.com>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Jamal
 Hadi Salim" <jhs@mojatatu.com>, "Jiri Pirko" <jiri@resnulli.us>, "John
 Fastabend" <john.fastabend@gmail.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Paolo Abeni" <pabeni@redhat.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Simon Horman" <horms@kernel.org>, "Tariq Toukan" <tariqt@nvidia.com>, "Wei
 Wang" <weiwan@google.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp
 associations
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Bert Freed" <toddfreed@meta.com>, "Daniel Zahka"
 <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261111005533.6436-1-toddfreed@meta.com>
 <20261111005533.6436-5-toddfreed@meta.com>
 <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com>
 <CADh2yMx8MPjcH7Bpj72rNNd_tT=6uSC5Ow9JyGjTMjFgs499Pw@mail.gmail.com>
In-Reply-To: <CADh2yMx8MPjcH7Bpj72rNNd_tT=6uSC5Ow9JyGjTMjFgs499Pw@mail.gmail.com>

On Wed Nov 11, 2026 at 1:23 PM EST, Todd Bert Freed wrote:
>> I'm not sure the kernel actually needs any bookkeeping at all for these
>> generic rx spi allocations. You could probably just pass the spi, dev
>> id, key, and probably rotation count (as a device key generation of
>> sorts) to the user without creating a kernel object. For socket
>> psp_assocs, the rx state is consulted on the datapath before queueing to
>> the socket. For tx state in all psp_assocs, there is the possibility
>> that an SADB handle needs to be cleaned up. Neither of those apply here
>> or in the rest of the series as I understand it.
>>
>> I figure the tc ingress rule can just take the spi and dev id by value
>> rather than needing a reference to an object that we create here.
>
> That is how it works in this series. The tc psp decap rule (ingress) does=
 not
> make reference to an rx assoc ; instead, it should have flower matches on
> psp_spi, psp_ver, and psp_dev. That effectively ties it to packets from j=
ust
> one rx assoc.
>
> So why keep track of rx assoc objects at all? Two considerations.
>
> 1/ don't accept packets that correspond to a stale association. That is, =
even
> if the device decrypted the packet, it should be dropped if the device ke=
y
> which minted the assoc's SPI is two rotations behind. For psp socket offl=
oad
> that is enforced in __psp_sk_rx_policy_check() with the pas->generation
> check.
>

I asked why we needed to keep track of socketless rx assoc objects. The
above applies to the existing transport mode code, which is my point.
The rx state from the assoc is looked up from the datapath. It doesn't
seem like that is the case in this series.

> The spec permits SPIs to be reused immediately after two rotations. So th=
e
> device could decrypt a packet with a SPI that is more than two rotations =
old
> in that case, or if a previous packet is being replayed, for example.
>

A SPI that is two generations old will cause and auth error on rx. The
hazard is that an old tc rule with a SPI from two generations ago can
alias a different SPI from this generation. Userspace can just flush old
rules before doing a key rotation. That is why I suggested including a
'rotations' attribute, although that is probably not even necessary to
keep track of which rules need to be flushed.

> 2/ hardware offload. the solution to #1 should be able to be fully offloa=
ded
> to the device. psp tunnel mode will be hw offload only, and is implemente=
d
> in the eswitch with connect-x.
>
> We could add a psp_gen flower match to replicate the pas->generation
> check, but the device has no access to the pas and can't offload that.
>
> Keeping track of the rx assoc means that the kernel can take action on th=
e
> "this assoc is now stale" event. Possibly by enumerating the tc rules and
> either deleting them, or marking them stale for userspace to reap.
>

I think it makes more sense for userspace to just get rid of the rules
before rotating the keys.=20

> -Todd

