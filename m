Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D020E314
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744992525; cv=none; b=Aa+WaBcDgVD4Q1iIFUiQ3wAGuwonnMFz8Ckhc9Qwqi573QzrHUzEKtyyuGhm++w9lwxzUSEFTL9oDbZfuvR0j8KQtpGEV0iFgKtxA5okupz11b60lB2yyUFeWfzUN5ykKs4Z6Uz0kEV1zbEyNCmEdLkA4PtvgnSrbCj74dp3E+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744992525; c=relaxed/simple;
	bh=GTRsdQyPhwEI7P5aYqr8HqSfKQVDCSCnob+lAcXVoLw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K1lpGzO6rUDTc+K/IKKFhNzcSKGNtf5Nd3edna6fRJxbr/hKn236G429/KapZtg6SbZfr7Xwskypk1AtK1Kc0OlijP/qHZZZVUnMs26RTRl0nbDWM7NCNh1tujh//01zapCXEKLKIznu+Y2Dw5i3z8duXNohRWpB3q+McMM4kAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=OUc7G6LQ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="OUc7G6LQ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso3639698a12.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 09:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1744992522; x=1745597322; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GTRsdQyPhwEI7P5aYqr8HqSfKQVDCSCnob+lAcXVoLw=;
        b=OUc7G6LQ73mGB3DSetYq+jgZEbW4ByPEhGZOhVLDWDlIX11Khz3KdmAJaLD7k+vveH
         q8oOBBBvxNkk0J9aApAIkkhXudc7L+kKIPlwaaV4IPHmUJjnAGwhneydTEl69jaIB+OR
         z1bIt9HDDFLliHRvUMG85CID1HNVNR+pSNWgJu1vqrszyX7PpCLNi1Nclg/sr8wYVpOz
         rckvt6+U1/KJ3XqkdeXsLQPh1a2pD+I0SSTBuAMbrkhHfUfpy/PiZ354IzR6NqFFd6/o
         5ZUzB38NSdvc4a1Eawm3VUeV87ROkIF/Zl5oIwm08/8NQTaZWzbN4V1BivP7hpiyzCwA
         N2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744992522; x=1745597322;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTRsdQyPhwEI7P5aYqr8HqSfKQVDCSCnob+lAcXVoLw=;
        b=JQxAeq7tDyiPeyFw4Ie1EchaCFXogd7KZU5Ywgxgj/D/smg9BW18U4/LRt/mq+l7bO
         mroddReqYncDQBkQndqHn0e2FnyX1eA3gn2Nnigr3Utgyw+fIHVukAhdAcOaFMkAw61f
         l+vEgnS/qzPP4uwLBBm5HPAGwPVsaAYlJcP97mOGve9qVH4lkPZt9WATYtY2a9s3V565
         D7hvNC0W/voeYAyxyBlv924Q1psWmAu/XC65smY5SLuEttiSWbXObPeKlJo9Hs8y9VrA
         RsSyTQxOmB2yXRSgn1OQ2yty0AczkYwseiKaFBJaZBFmQyZKUj8FYIL9uX3XmoAvXtZf
         duOg==
X-Forwarded-Encrypted: i=1; AJvYcCWSIm54I7GT62lJ9vYgkR1DG/5DtbQQAuU9xvnFVwFxqkdRS23BdwrzYBrI688ErkyldW3Dghrm2zM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypbt0eVzEzxGPBEei7hYKAIcihgjr+oBTlbjssZ/zEAGR2E0S+
	F0/HvFpEfXPkathL0x3+KgPzPvJTD+hI8j6Z0et0pHd/CXktAIQzucNpYd2TVnM=
X-Gm-Gg: ASbGncuLGkw2WCq+ORxvoc/uH+GIAxrrIek4UQevs+ZS7axVgvUMzua/DXG80i/XypG
	aFhtJyCcdRyJPO9E7lCWr1oFVJg0H7qFDtEwezYpdoXEIl0QwI++FrGNJcnsuvoGhAl230DlVCM
	UTTi+gkkZZiz0tO4PdlhOptBniZ/xbgYXUIQZ5XYjcjxb7BmJYyh6v/0iZh1ylq6aNc4QvP4YA/
	q1HOxhu5Dhw+oy1sye3mEu+81jtNAU7O50ynvYjsLowGusEz72lA7/OpZjRoUY7zPpVupRaONdM
	SkkVFnjSRBEiCuqieCfx3uk2L0MzGLY2MZpBiT59qVj4
X-Google-Smtp-Source: AGHT+IHa4TgX8s0MmpF8GB8R16O010Ve/qC4qv/99ZOSj9/ybMOt/qI/ikL+RDoyJZEPVnEbqnzHwA==
X-Received: by 2002:a17:907:3fa1:b0:ac6:d0f6:c85c with SMTP id a640c23a62f3a-acb74b36c70mr264464766b.20.1744992521672;
        Fri, 18 Apr 2025 09:08:41 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac5:506a:2387::38a:4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec51601sm137723466b.74.2025.04.18.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 09:08:40 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Andrii Nakryiko <andrii@kernel.org>,  Eduard Zingerman
 <eddyz87@gmail.com>,  Mykola Lysenko <mykolal@fb.com>,  Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>,  Martin KaFai
 Lau <martin.lau@linux.dev>,  Song Liu <song@kernel.org>,  Yonghong Song
 <yonghong.song@linux.dev>,  John Fastabend <john.fastabend@gmail.com>,  KP
 Singh <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao
 Luo <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,
  bpf@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 2/9] selftests/bpf: Add socket_kind_to_str()
 to socket_helpers
In-Reply-To: <20250411-selftests-sockmap-redir-v2-2-5f9b018d6704@rbox.co>
	(Michal Luczaj's message of "Fri, 11 Apr 2025 13:32:38 +0200")
References: <20250411-selftests-sockmap-redir-v2-0-5f9b018d6704@rbox.co>
	<20250411-selftests-sockmap-redir-v2-2-5f9b018d6704@rbox.co>
Date: Fri, 18 Apr 2025 18:08:30 +0200
Message-ID: <87h62la1vl.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 11, 2025 at 01:32 PM +02, Michal Luczaj wrote:
> Add function that returns string representation of socket's domain/type.
>
> Suggested-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
