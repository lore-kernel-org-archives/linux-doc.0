Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795718562;
	b=WNVLkhiLoEBZyaYHZAUNNtxGyZ+ezuD4BcmK2O5ZF+sj8a/RzncMdOcBUVzAVIAAX+r6
	 yT9j4XmabwP0MbxnO4m2DqqViwIuPa3Ox2GsC8zgf4EDpydwf+SdgG7TAXJ1L8cX3hYP3
	 zzSdR5fy+zSOjKWhsAqgRUhhuGCqtItnj8Pq7vfdCr2/r8T4QnJIHYhxSon2fxU99mLz9
	 VhvpEeZZ1rgq6iAEOF3plFcDuQHq+t6oQ/e5dzPxgsyHOyO5EiDtxnUbDaX0ablWhLxZY
	 8Ebm81Hcj5FJTfCeZrP4Yd0CwEBqNW2oom1ArkMRPsiB8PF3U72h9C90O0pu2kkaVUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718562;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
	b=rdmmTxZ/kpyVjW1Pg6gXX0Lss+T5tqJKcPZRC/J5sFYXv5WSRZo2IRSJOCnW0tOlKdx1
	 U2tuSzPGqjIHmnQEGoYwbwPEH4RzklCeP/qbTSB7TVvq9cckkdzFBggDhbmWPneIjnVql
	 F9osLPTPX32LipIMgaMJNPAelg6Pn8f7przu9dq2vqQWvm1g1ac9f6rUDl3rJsNDKYhy7
	 m6+tltJKH/CVhfZfKHUkhbg7HYrX5uxUE2uco5hSBlI3cYhZdZ1efDbCRSfWn2SaLG2fk
	 C9tG9u6sRtl7smMm/1LqELekbuvRH2v8rvemdLs7gufJ006qBKUQdylE18mq9qC+70g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dSJV2yS5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AfZRd78T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF82B606A323
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 18:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF82B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dSJV2yS5;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AfZRd78T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795718561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
	b=dSJV2yS5i5n4Y0qa8QpYgIlvjQkV6ztVeP14NykEmG4e8ZTbbOguUnFGnuZkgM1hfvob6r
	JsVpE2hnbjdJj2tNxhz/Zlwdqw/UfaoJiNIXP67HDDrgplpsiOxKUG+XGfh9aXwyPW8bpA
	cl83VPqy12HNsmZ2ziLdHqi20GJFVHs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-5uC02KMaMPeirRJIi1mtuw-1; Thu, 26 Nov 2026 18:42:38 +0000
X-MC-Unique: 5uC02KMaMPeirRJIi1mtuw-1
X-Mimecast-MFC-AGG-ID: 5uC02KMaMPeirRJIi1mtuw_1795718558
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92111028a03so129992846d6.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 10:42:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795718558; cv=none;
        d=google.com; s=arc-20260327;
        b=etOa9Y9hkTRD8ba7emvu9mDCn6+tIjhwv4CqsqLqdI55xbB7EnbRTzfwyJ+lhh5GMy
         Q9XR4IkjOTX+aOCp+ehuN+Ty2ixBlNeoZu+ee+8n/uWgO0lwq/x8G+UezatATRqLU/Vf
         rlk9ZKDhgfrEiT1//q/FZ8HSY3V6zSJRMKCXP0KTv9RBbcfuQqmlrKMGIkZP8GfO1TXO
         fUWr//MwtQ6WOx8ufgd5s3glYfsWkc2ZSz2TxDplfyn1r6ye9GwewhcAnM3blSF0ixPl
         ozEAuadkwbFfflMemQsCChmmfItLNXT9smg2FXKBcpO3TtO2UiOSlOAOzpl3uflb9W+S
         2MRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
        fh=tpOwUz3mDiEbHnLCJmnh+JvDRojia50a5DEG+TF1sXc=;
        b=GQDHWdJHnF9XdDL89mLpvncSDssGdh5qvy+164U0b5VnsNCPBz/ltdJzkM0wVNhweo
         RumqIFEA36yGiM+fHnFGbPs+nQT8+PFkhgo8s/V6pyzB6zZkCTajN3HBcvQHmzQ85J/T
         5d7bf6MwHUu6tcAmGOsfQ7ZeAwbhux5BXo1PZ1RpqGA5eNQTSQarvkMFGigQLVmYCuQH
         TrKv6LhvAUQCovWqG3vlQlDFalAggu/cGO8rNTQmt/9954Uw5K0lPjxx9V6n42JrYBMs
         elt5THOVOybD7gI/UyYCshOopj1M2r+Y1Hdrj0yV4cJKbW2tp2saFhvedCXpcSTVsC33
         iPMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795718558; x=1796323358; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
        b=AfZRd78Tl2My6cFNYn6J2IoXlWU7jd9dGbwrI6sPcEv8IbdB7fLO2XDTbfQrF+Io//
         ixsvT2itMWfRas0wyep77elrun0b0HGJrXml5mtbVm6K8dyKkh0KXNx0lrSGsPUkPCd+
         htlBpxymRJe/MctD8/s3oBLQrenF1llfpvNVhQu32t7LIWWg1Bh7H8nsKdn3e7FAE3vz
         mQxf/6gLyv6dziabFgdbxxM1bskyM7oKpN9JDuuuJ0aXwEDBLVIA3qoPxkSditthi7C9
         qBl0dW/paw/ir3LbJm8JTGe5BmEL00jx/ma8TFxiJ/0OxfY1hFMGLr2/eSwDP5uNRg0l
         WIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718558; x=1796323358;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
        b=p4rYLQnlR7jzqJ89WZ8Qrq/W0w28fDIz2PDkBUUd8yiH/ovYX63WzU0k18+gOuFgMe
         QbM8vC1t1bCZHrKHtXAZX8DkIz1Ti9z6ybki+T1Xqozaj7S1PP2fpfmr8lF15kramYpV
         OZrVar1aTaCAyNlQWv25icDPB8G/Ho7W7ZKR1R4Ax6wtH2HPXkhib0BrNOohWqK+Jmb+
         X7DEwn/7m/Tf3s/Ebm7GU3Ml707vf02IzfE+KfFQE8n9RDRVoPHDkuoB/qQDNR/P53K0
         NWiWsGIUn3y0pmE83Wh8wWOaRN2JA5UaWnjEiymMY8pEKQv1IgrWpDGI1VtotOwxi1dS
         arqQ==
X-Forwarded-Encrypted: i=1; AL+hErHH4OJ1XOmUavsHNiaGti+EDo/ZGxeLkJAtP5ccG/JXOdG9Qs8KtygPwYofeEewBTYgdt04XkP9R90=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LyafB4QgLqZv3zxUQIN/8t1hZi8B4ZjnYqe8nkduKsK1AH1Ru
	ku6yowHStFxOzY22nY7H12Gt6h1V6xu5t1XPV3/EKosnuMRA/Ap6cwgYRTKl+fz4nrwyh2mQCMm
	B8V/DgQX6QF2hvolHgW50ovqf2QGSOZsowpMcjoZtTjpeVUDnARErt8E3n1y3oLa9eszNPzP8zZ
	7skAcXputds0gp6wjxWhsr1URnp6SxbGyEZMDR
X-Gm-Gg: AZFdTZdqMgeNeVvXHf489HEzCdKbwsBzXWHvh703m/naJbHzLhTwsumYU+Jq9GJl2Jv
	aEIr9w3M4+T7CpIDzuujWLsqVIGHv19v1IG60G2GdSLbF0c4pcm6gmQcSFVkz6ZsjHEBtmy0ooi
	ZNBVFSRw3RyAADlbOaheHKz1G9mmccwrkvgAIR9aszXwuLSJc/Ifckri4=
X-Received: by 2002:a05:6214:5701:b0:921:7c1a:5953 with SMTP id 6a1803df08f44-9217c1a5a29mr99541766d6.14.1795718558207;
        Thu, 26 Nov 2026 10:42:38 -0800 (PST)
X-Received: by 2002:a05:6214:5701:b0:921:7c1a:5953 with SMTP id
 6a1803df08f44-9217c1a5a29mr99541386d6.14.1795718557797; Thu, 26 Nov 2026
 10:42:37 -0800 (PST)
Received: from 821463759402 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 10:42:36 -0800
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <awhAaTuR375RpyAE@sgarzare-redhat>
References: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com> <awhAaTuR375RpyAE@sgarzare-redhat>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 10:42:36 -0800
X-Gm-Features: Aa3M54odw2FRTdRy2uflU_aL9ZEV5X35-hMgLihiDc4DudGmLOU2wiibEdItlhY
Message-ID: <CAAiTLFXT_Dqs8sUY+dL7KhXL=-QYudikb9kVFFRvGv9Ri7y7ow@mail.gmail.com>
Subject: Re: [PATCH RFC v4 0/8] vsock: add datagram support to virtio and vhost
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, Alexei Starovoitov <ast@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Bryan Tan <bryan-bt.tan@broadcom.com>, Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, bpf@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Sashiko AI bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Stefano Garzarella <sgarzare@redhat.com> writes:

> On Tue, Nov 24, 2026 at 01:20:18PM +0100, Sergio Lopez wrote:
>>This RFC adds SOCK_DGRAM support to virtio-vsock and vhost-vsock through
>>the existing AF_VSOCK API. It is intended for guest and host services
>>that exchange independent requests, responses, or events and need message
>>boundaries and sender addresses without a stream connection or application
>>framing.
>
> Thanks for restarting this work, I have finally found the time to took a
> quick look, sorry for the delay.
>
> Reading the cover letter, it is not clear to me the changes we are doing
> to the core and VMCI that was already supporting DGRAM. I'd like to
> understand better how the backward compatibility is handled and how VMCI
> behavior is preserved. Also reading commits, most of them just contains
> a description of what the code is doing, but they lack the reasons
> behind the changes (i.e. the why).
>
> Overall it seems the right direction, but I have some open questions
> (some of them discussed with Bobby, Stefan, and I at KVM Forum some
> weeks ago):
> - Can the virtio flow control be affected by a flood of dgrams ?
>    See https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.4.html#x1-5720001
>    and virtio_vsock_pkt_info.reply / virtio_vsock_skb_reply(skb)
>    handling.
> - Did you test virtio transports when VMCI transport is also loaded?
>    That one is automatically loaded (for historical reasons) first time
>    AF_VSOCK socket is created, if af_vsock.ko is not loaded. So could be
>    a common scenario.
> - Any limitation of the current implementation that we will need to
>    fix/implement in next steps?
> - Any performance number?
>
>
> About patches, I started to review, but I hit a wall with patch 6. It's
> too big and really hard to review/maintain. Please split it (e.g. the
> refactoring for vsock_assign_transport can be moved out, etc.). Also
> there are too many if() with conditions duplicated and few comments on
> those conditions, for example:
>

I agree. I focused too much on quickly addressing Sashiko's feedback and
things went out of hand. I'll rework the series with a focus on
bisectability and readability.

Thanks for the review, Stefano!
Sergio.
