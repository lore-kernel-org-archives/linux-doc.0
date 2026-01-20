Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3833816EF
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903013; cv=pass; b=D94cbqj7Mtb2yowfuwQy4zbaVrIKsdtWraFMmuYD6XIED6uupbc4KSdh2sRITxKF0vZ2r8RXaXO3x06GrWj1sGa+Dfh9u/HXwMassMwJwinFoIyYXdX8r4NShXLG39ifEIiD5gVekNIKI3hsqmNwsMi4LyA/dfkSM3BDL8f07Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903013; c=relaxed/simple;
	bh=DCIjvxqnB0B7Gd0SJ6C+JyGFfo1rtrAw0nwrgUxl/bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDAPYI6sYR3mamL4Bu5E+y1M5o3eoIIdQsXY+PVdUuAJMg/dsrGkC5o+z+JrmoNE3aOxeGtPuaCUZBw4x5J14+LZAs6vYheOwZd/RYkaOtJz/h/iFX+CWa+W8Chn5tUcA65GIqNAMc+KwblxshOmq39CniEAXo8CuB4Q5IZHR9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sC+3BJYd; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sC+3BJYd"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5014d4ddb54so55629851cf.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 01:56:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768903010; cv=none;
        d=google.com; s=arc-20240605;
        b=ISZNybf6RSTGpFRGhpxStdRUrfv1QRILkU5hdinkPaJTblT4TPr6GMNreCDepWkGar
         5ZMnlNtbS5nFgjpr7Q0NfRbLJZxpVuDZx10UGBkDcfRvY16o8aIBMp6mdEpLmltSFS94
         YLEMCW80EGDerbWHmOv5X1uU2GaTSoxzobMdwZ08F8XcvLI4N20ORuzKS2AM8QYgj5P0
         S37ak9p+RtVCn0//BErCVpiesH3LSbzi/YnUyrpZ+yvfrM93vxlRQxAZRYgQtQxptJno
         kBGmK6izVSD5VgS9svK0WngTrUqXoHYXoRDA0hme3mX5BsJrb05P8zXD9G2a0NgQogMy
         COUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DCIjvxqnB0B7Gd0SJ6C+JyGFfo1rtrAw0nwrgUxl/bU=;
        fh=EG4HNb6UxCLPZzNKvs7IVHxhA0xVp8n//l+uP3WPL84=;
        b=gqV7/OsG10v79aRw/JTaIJFQIzaUYAKkZPhvU8d0IJ0nXi0XsFW3yIRPqrNXTRSfsN
         qf/P6egm0HgKkMRh1Z7ZVquCew3GkX3RHe0HtzlS5bYie4D+wE1HmxVNkP1C9UTVW3aN
         oOiTc6PNhRYsNLDwNEX+gVXDsrls2Yw0IkTpuHlNwKGxJXy2yZ+q5HOMkL9OoNImHSZ/
         IXKFeW9AC9WGL3pQ2G5lHXfRYcU9HKTm+hPMpvqbHZ+QQ8KtIMNWrT8nPNMcZrpshThI
         kGJpaDSjmHd5uRh3Q3jwGSs1pwd0W+EpPmm6v2fxQdsUpnOoJmJfXQcK93N9ptSf/kTH
         GasA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768903010; x=1769507810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCIjvxqnB0B7Gd0SJ6C+JyGFfo1rtrAw0nwrgUxl/bU=;
        b=sC+3BJYdLRdPaoRSsy/x1W5drfo0+QR4QHQeT8q5zg6yX1VUXoRM3wE6ugSBEkxgdP
         NX0BJFAm5JuE8lqUvuNacE2gOs9e8Wytjjnx6+52ilbyPPKe+9Km1A3YUUkR1GCqN4b2
         VMuteNaRFkJpmpaXn4Ny7odsg/rgFE2Q5dWBR7gi4mAbu77e48AmAw03WQSnYdXAZmZa
         ZhQyupfOB5nWmLvYQjL/P5W8C8gIrRiAARKppSdJuNsQxi4lYkZqUJp1sdnixlxV9ijr
         Ju9dJ+f3C8VYa/UeUraNoferl8TMT6QmAhYHCdIh5TING5tNahYXLx4a/xBspr+WJFNi
         gQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768903010; x=1769507810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DCIjvxqnB0B7Gd0SJ6C+JyGFfo1rtrAw0nwrgUxl/bU=;
        b=KqLFyDyECeiVGZ+QkV3zx1d8h/U8gEHVj1qrsgS9+TMdXeYQhRGCcQhzVu4rVFG9F4
         EspwYZ5F/ErX8TNtX1azY8YxO+zz9RSU+/RvAHU9ByfNzr0w4qwkvMfsRCE/yqufGoTb
         QcY3dUQrMz+qaqtxppbXuXaFuoGy0cgs55vFNcqvLQ5JnzJr04rFp0bnQK6ggmO1S/qb
         S2/XIphS8KcLIh1Vm9S9iMSvKuteHBXXgisd5ezTDt+W2heXe7+mTde4ocEDIkbclzY+
         JZ9D8ciW1NhdwFcCgQa6P0ppqm9rv/WkXK0oX0rk5xNJxy9ifLmoxPrw7LSa9YnOovwN
         +fZw==
X-Forwarded-Encrypted: i=1; AJvYcCW0RBUILetAKWfThDhIV00YJnhre0/o94hhenwXH93ntmnXVtNf7I/s0L/1q9GkDLmXzq0ycA5aVhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtDtdH9UqRD2rnjR6x8AfVH5bBBvSVVAExw/srV7Ab1iR8PO59
	XmQnt9E4HjWN/SOoSaPESqL4R/4lScV8zSg9rdZcgXETouwLY6ceABLIrl9L+N/52MkXI43E5Kp
	GRTamhNYvqwh29nyOZZFt+mGSPzo0WhxE1uC8eXIU3LyFhqjFdW1GS4c2
X-Gm-Gg: AY/fxX5/LMiWn887SI4q4kVc1EFKuLaSdo6TdNGdK8jfmm9A2XYwPO2OfYUka/G5eqU
	jLVK+19tqFsEy1XPhambtJBh2C9Dmr6U0FyxdzfppRXIjgSN1UdFaBuxVhAGPVNVWD7QlS41SLf
	Xt9MGpv/W3lWpTOCzwsrSzsIA9FzKKlHpqQZzvtiJC2/74ydcXJCQndZWMrwjXJ0XAsHNucQ1Dm
	MsPhM10xAXI3Ni3x4UxEON/M9DNy1yQCnZBrq8G9Xqk/5eGlIJgnSibk9NilZqIGExXflM=
X-Received: by 2002:a05:622a:1794:b0:4e8:b9fd:59f0 with SMTP id
 d75a77b69052e-502a179c31emr197588841cf.61.1768903010232; Tue, 20 Jan 2026
 01:56:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-6-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-6-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 10:56:39 +0100
X-Gm-Features: AZwV_Qi434Atr1gPGVfzbX7Cut4_5_Pnu1U9A-PDsd4oFP08xwfXslULTipllTc
Message-ID: <CANn89i+P_g8XB++mQ-MMXSSaTURLsohqnxHBcVpVrBBBoru91w@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 05/15] tcp: disable RFC3168 fallback
 identifier for CC modules
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

On Mon, Jan 19, 2026 at 7:59=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> When AccECN is not successfully negociated for a TCP flow, it defaults
> fallback to classic ECN (RFC3168). However, L4S service will fallback
> to non-ECN.
>
> This patch enables congestion control module to control whether it
> should not fallback to classic ECN after unsuccessful AccECN negotiation.
> A new CA module flag (TCP_CONG_NO_FALLBACK_RFC3168) identifies this
> behavior expected by the CA.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
