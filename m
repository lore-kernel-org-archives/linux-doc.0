Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5532ED16B
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 08:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755766653; cv=none; b=ax6Xhl8EFjkQ94AC2I2WjbsBk330FUrA6VdAHhVmVcZ0d9nGwvYOcJsCB4Kmam9CHtONfjQiYMrCV2qomUTHpfJ3sikiyTkZFkdV51H0OqkiISRf13Ft4UPeFIXFAEVMB+8kdZILhgStUx4cwxe6DwTasAYSoNcWFI+SwJgh7tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755766653; c=relaxed/simple;
	bh=wVT5bcYYu2qAxq7+XV3bkPlP+gOJjAhgpOYa9K1uOUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnmRMD1Kei32fcWcAZu3JGPgA+/Azazx5tBE9yZ+l08AGBLjQ97ioX2l9F41nEqpTn3c2dxDbtvAhvOEgVROBddHibm5SI69JV0SxGO89Vl9+lH8QLh/AwvPbbR3j1yZbJhJ4WZMWXG2eSbIrCm4CWrpelFYXJRg0nm+LK2cQUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lY96GWEZ; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lY96GWEZ"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b109914034so9031021cf.0
        for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 01:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755766651; x=1756371451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVT5bcYYu2qAxq7+XV3bkPlP+gOJjAhgpOYa9K1uOUs=;
        b=lY96GWEZyWo3pDTABhmd3XrGbIAwAZNuGnXT2hN30zdVIECMDcrHQqdqOs4I622SVT
         Y0LY4xPRUrWnD9jE0CvCHC7R5l0jV/ZnNjz8FJcXqZh2E8Nwye/7WKlwVRGLqqfCdFNn
         kzfwoFyvkkz0JVwHfPUcx8VjmSPViGW4HN1uRqnf4ZYHFhPeoQPJQc+9w+rv3l8NvUx7
         JIPL+iZ/5z8EjtVqYRxRapoHkoOMQP3RJzXvE7HHWEM76gqbeSMQudSLGySgLpZr3lDG
         LD2LUgCKguWJil1VXih3ObjVcbbSKkeh+SG/F4SRXLDj9ew3ZPz5Kupwlr4b4b+p1ReQ
         SpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755766651; x=1756371451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVT5bcYYu2qAxq7+XV3bkPlP+gOJjAhgpOYa9K1uOUs=;
        b=d9tHFoihsISqnbsydd9/zkWCXxG2D9LlkSC3HayIo86ANzOQ+2MEc8j7asq3NLcxg6
         r554O049itng2VUOd0YG+QPkBtJOQskidDceN8FMOr/Nz+Tdm/GM/opf15KtqFFpmX9p
         aBTt70Xutte9ny1hkYsRCpjHZ4pGxBYAHRsRxqEwacEJuRt8CLzX++r7xvSZi8OCcR75
         uqpCRxOri1BBOkvfIwRHcaGHoqKBGHaAbXSQ4yRFtKJCNAhh5FEZTB5LBM+VRgvLtuEC
         t3qXoUSHbXPjj2rBOPKYyXhsKD/4VyXFs0ucIyuRNx6UOvZhs6IX3VJvy2sV31tuV7fx
         WeaA==
X-Forwarded-Encrypted: i=1; AJvYcCXDN+8TU07B3XsfN0l4sNT1lBBCg0JtGbs2HR+17yGb2VxAq9K+wY9iyiduVcT+RwzieIb37r63Sns=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHKRhwdYEkrCxcUJGVjvpnnjOjKeOaon4yP2B1j5+ZoReYbVNh
	ygSva3A5WWP/pXxPJyTxYwUh2yhvc7n8jxA7K3QfM5bwbRcIu92D7AtaDEvTZ7tlKHwTnvBbvub
	zzBtBClKCcDAIi1WJR8L93ZPy868e/MQ400gQO0Zq
X-Gm-Gg: ASbGncsJ1h9qhzdbKyqxz1LnYkQ6x0JZmonnx8BXj/xsePuVjBBLxOhFFbQK4BQtLY+
	XlCfHQIGSc9GDzmwsO9mI5U1+Xil9uUB1k13iCns7LUuCgUHIUUm2RuAxYw3bVOboHw4FDawKW7
	46LvWCmusS6z2BCU+WnMiNeFevB+nlTDETx6sRkZLhPxHIOgNCPxvQpfP71ThE7VNezvSEUbmAB
	W2n8WEXUQmnPKLex8cyTEmULA==
X-Google-Smtp-Source: AGHT+IHFkVfP6J3M/7hhl54OhQNkRmBSxPwdT/1PDEOLJvFDH72XGIwIh7eQr1CXffsV0ym4huij21JS8QYACP49XxI=
X-Received: by 2002:a05:622a:1a08:b0:4b0:b7cf:8cde with SMTP id
 d75a77b69052e-4b29fa3c3femr16301551cf.21.1755766650133; Thu, 21 Aug 2025
 01:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815083930.10547-1-chia-yu.chang@nokia-bell-labs.com> <20250815083930.10547-8-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250815083930.10547-8-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 21 Aug 2025 01:57:19 -0700
X-Gm-Features: Ac12FXxEjL-42H9O9a-b_qJb1E8Dwb5jTLFUbV4y5evL7fDRVFtenhZTNyo0XGw
Message-ID: <CANn89iKhAKsoZX-=LkMNTjghoyuZ5r1rT=Pvu=wua4M=DPSWBA@mail.gmail.com>
Subject: Re: [PATCH v15 net-next 07/14] tcp: accecn: add AccECN rx byte counters
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, linux-doc@vger.kernel.org, corbet@lwn.net, 
	horms@kernel.org, dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch, 
	donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org, 
	ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 1:39=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Ilpo J=C3=A4rvinen <ij@kernel.org>
>
> These three byte counters track IP ECN field payload byte sums for
> all arriving (acceptable) packets for ECT0, ECT1, and CE. The
> AccECN option (added by a later patch in the series) echoes these
> counters back to sender side; therefore, it is placed within the
> group of tcp_sock_write_txrx.
>
> Below are the pahole outcomes before and after this patch, in which
> the group size of tcp_sock_write_txrx is increased from 95 + 4 to
> 107 + 4 and an extra 4-byte hole is created but will be exploited
> in later patches:
>
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Neal Cardwell <ncardwell@google.com>
> Co-developed-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>

Reviewed-by: Eric Dumazet <edumazet@google.com>
