Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D94F3D524D
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 15:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007837; cv=pass; b=mu4QIa+VVcBqnajLymlHU9rBzFfVlN/LNMfEKMK5bsYE5ihypOYJPiMx3XCm6cmhusIXnbRr9t898f/LcmmwzlaZbgJZUQvEraQ5TX+tDtZXUwQotycVcJZQkQPG9ehP1AKVCFbycDZm+BWi2eAA1rbbu/wgJIN4z82UzzZIhjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007837; c=relaxed/simple;
	bh=QnaNpo6lSG0kfxJQjSpSQ0lKtOo9FhwWS7NgxulV+90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSwGIzXig+IIhY0jTm4U+RPzCwuZNHpyI5vo5oC0fbfGLbdFqmlkoXcGIU2UbPnQS0f2m1e3usBZT/I4C1MEycXPFZ5wPzIXM1XkO0zUonMZBqPTvokJIJj75hoVLfLbHpn0Swd49qwh/topiR0B7KDF/sUN2wTfTTU6zrYBGoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GbCPjr8u; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GbCPjr8u"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-502a26e8711so29034701cf.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 07:03:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769007835; cv=none;
        d=google.com; s=arc-20240605;
        b=Y55Knxsy584dhOZeg5bHRSV4taKue4Ei1B4qn1ezGrC+ZdGSrb0w+7eWBfmUjf21x9
         R/gceFWa+UfafgJYRBEYT4zT4uoD4ou9M4D+554pEp7YcdaOxU4dEHqI2MoXHNzDOz7a
         LV5AIec6IoMTz1JpbEGiMYTqkscjJ+QrUIfdvzZjZyBA8tMF1gZLd3DLnagt5sxAmswj
         Ya9pjt7cO3nYI9H3ftIC2azBxrOi83cvk+NqVtxmuJvV95wY6cVA52ihimZsucTfpJBK
         vMBa2tjqquN/jn6OR3ysbkgnteqHEDspPHrNIb9o0Q0YW8wdKqlMxf2wDi+FcmlsOeNM
         YptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BkfXslef5CleGTOMTYe++OlaJ9VsT1NdIrx0Bt2jP6E=;
        fh=rtSj6Je+52jalNMwcDkKGe5nssxIaqSLYLbPfNigJrM=;
        b=eTKJztwVoSV7hsOgByr9765C3nEKxmESR9vQn39KkrIaMxeudedbf9/+k1zzSE+lio
         cVeY71vSoBXV4RTn9MJJpp+sjZzILUXq94TPeVlzLe7diRHjb17u9pSn5WHaSeri8n9D
         TJyuZbo9vo9QLA+GsnuaP1GDEj3LHSkjsA+6Ug+hHXE8MC7BtdZavhlrnuXcaKZjL/Ai
         7+mLZJBbMp46HKesZfATz4yHWMfslETCQkuXz29c6br1AOuVP1+qZjZr88ygwVXQR1mk
         q962C1zR3zV5AS4OFFnCPR/NbvHBL+dQhicc7IXr8VHubWdScidskTkH81iP8/6tj0wk
         8FeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769007835; x=1769612635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkfXslef5CleGTOMTYe++OlaJ9VsT1NdIrx0Bt2jP6E=;
        b=GbCPjr8u0SxkrNuOj/F+aztCCHfE5nwZe9Et23PvmkjZfL4RKDUh4WSOqoedBr9LHH
         Hw1PETrMTJsNeCxF1eqy0FlUkwuBH7i9JmVdG0a6bh9wA+of1Ty0d+pC6JqdqOCw1pBf
         i4XCZi8hYLgRdvEC2MDuyBaH/zrJH+/7CkT4MHypOyO/Aa6hxdJsaiUIkBetAeVlMO+W
         B95p3FLmq5CDKQT2T+MBwcJbZHNwL24IMtPagFbPJ2yF0eZ/gi2tKDRsxJ3OFYrVkhVT
         srzWEQeIXNXAABEP3EfdHSvVVG1DosM/p78pjkxF80ZM08HE+LeK+wDQNoeYxSaRzo1c
         Dseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007835; x=1769612635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BkfXslef5CleGTOMTYe++OlaJ9VsT1NdIrx0Bt2jP6E=;
        b=vk+RWEZ8mERcGJm3FnnlvlH6a0RfSdr2L9LooBt4G3CJJ+88v2E6ZDZqXtsLQHlgSJ
         pIn3GI75WInh0NWPGodZ4loS8Q5nla8gduolRsf+GNRXajtyCxFv9rP7D25D1rgFJjBD
         OyBbCDkpsvjK6fPmZts9MlW8LmUcLMRHMxUxo/WOQQWimO4aHxaQCeOI7jJSSOFnlE9+
         XKx/HaH9XP3wbUXiRom6M67LgvNaBuwE9za7OpK0GTdHm9obgIMh3xRTRaDLBJnn4TXK
         RMSym9t4AGYLPs0cNfsnDJUSVUDwtAgrRRheI79XD9dasfE0p89A2FCDa8fW7gDavtHm
         jEpw==
X-Forwarded-Encrypted: i=1; AJvYcCWkOWPjz612nkpmRrbpcr73MMjc6OxP58OkvCBVT3oUws658u4qSpPjhFw6TesRwyC50BlkCDjlKa4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaaWssPVJoSw7pmMswJM0hjG4MQ+MCE/j5m7/xciljOZnnPwp1
	d7exlh2CqGypMSOm+a9viIfZNVaRA4T5MD3iNhF+DgcDRiTu1SMmqWhsSCSy3l97thVRELu0mf7
	kjxbgcK2ZMcgGrnM8onC4w1CsKApNMHiXON450k/b
X-Gm-Gg: AZuq6aIw2qGPWR2VQdDsAzVz9Q4xOd57y8KdBODvUR8JXW6CUkAMwtyZfD3IeM49bzI
	X485ZVydIGNPuMC1tpk+l0Z/O/vLp+wUh1jnQ31Bd5qAGf4ClochTiy7O3gVXykQKOInFuklD8b
	QuZOQg02peHbk6+ROTSnharSWlp6OJaKfnXWSjKX10qUCbPjb+jNfthRgEb20k71mf2ayq0KzHB
	SV+EziCWubgWiGUoVUZky/lOmofRGHypEcoKJOpNlijs2AxT7FzUjuNpvZbOdSlv3bSuS8=
X-Received: by 2002:a05:622a:180e:b0:501:47d3:217a with SMTP id
 d75a77b69052e-502d829a969mr66313571cf.25.1769007834257; Wed, 21 Jan 2026
 07:03:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121143215.14717-1-chia-yu.chang@nokia-bell-labs.com> <20260121143215.14717-15-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260121143215.14717-15-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 21 Jan 2026 16:03:42 +0100
X-Gm-Features: AZwV_QhPskOIydB8GymjUhQQqHYwHvz2ukB4yAm_VArjAbRnW32yObrkavrJhr0
Message-ID: <CANn89iL6ax4=xk1Q+KhiSRAQwCRpOSPVLTe0gwjBf0FBd0vm1Q@mail.gmail.com>
Subject: Re: [PATCH v10 net-next 14/15] tcp: accecn: enable AccECN
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 3:32=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Enable Accurate ECN negotiation and request for incoming and
> outgoing connection by setting sysctl_tcp_ecn:
>
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> |              |  Highest ECN variant (Accurate ECN, ECN,  |
> |   tcp_ecn    |  or no ECN) to be negotiated & requested  |
> |              +---------------------+---------------------+
> |              | Incoming connection | Outgoing connection |
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> |      0       |        No ECN       |        No ECN       |
> |      1       |         ECN         |         ECN         |
> |      2       |         ECN         |        No ECN       |
> +--------------+---------------------+---------------------+
> |      3       |     Accurate ECN    |     Accurate ECN    |
> |      4       |     Accurate ECN    |         ECN         |
> |      5       |     Accurate ECN    |        No ECN       |
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>
> Refer Documentation/networking/ip-sysctl.rst for more details.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
