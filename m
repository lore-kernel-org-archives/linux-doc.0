Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E111AB535
	for <linux-doc@vger.kernel.org>; Thu,  3 Oct 2024 18:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727979952; cv=none; b=cwBCqu+Q+lOJXjRELkUOe+JILEUwhiTnnSuElmYoC6zwnZ9MJA48MkXo0K1q9G0+GIXCUPXimo/AcKnPG5LUboI3oJZaSdjRDDcWU6WUU51oBrZws+YD+KR/WZsIIXbfonYfAAlSGUL8eCe0loOjN43rxqwG+QxD3lJmE537MyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727979952; c=relaxed/simple;
	bh=VGOjcYz6UybyttbaRRC55EgjhkODZY6QYHHze9Ztxw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fp7Hi+uLmtKNQLxA26BdZwg3kOxYhsoEVq4ff7NwnC9O94VF5kmcgOfUXzogognuINlHziG9iW99RJ/u63Qquc3Fj7G/RssswPkblloCMjubYoF3MS/0xckMbVzv4fscuzsBMoKPrlpbPBxgwPi5CJb6xdYyCelt2AHFO7AjO+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iNos4jdp; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iNos4jdp"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4582a5b495cso35171cf.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Oct 2024 11:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727979950; x=1728584750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGOjcYz6UybyttbaRRC55EgjhkODZY6QYHHze9Ztxw4=;
        b=iNos4jdpUvyaRK1GVPOlm3+b6XgmFqrIgo82q/rW7siTZQqKDh35+wB5HbAi0PmeVy
         cuDO8eOanCdmAMgEz153cVElmjWy5XqijrEmhGtplAsdJVPmK2KGURETRC8cL+535q4C
         MWQa0GJVrZuU724sZnf2nqBeRHdNqJEWs/MsXIbSKVJbcfHjQWXq4WUQplCXl215pYRl
         sVz52QFrXYd4QIhKOrvMbGsehiCFfXC38J+wiBdmwgIefG/MCoUzK8Lk6C+XXds94X85
         jH4Fm+bPnyBgODDkm8Q3ICJori9rof+0/F+rlWsf5yHFKj5jB9evPAJN63UXjXqbHfmv
         MAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727979950; x=1728584750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGOjcYz6UybyttbaRRC55EgjhkODZY6QYHHze9Ztxw4=;
        b=qYJCCfc2T6JwPZZMbQWqRlDk3NgPfU64KnnLru3I9KVIfQ7rO8xfRjrbCH9Cl17bTN
         Wc4rnzfszEfUBAQgC291XomfnzQzNVb+kNDYq7nHbxYSft8VBtOy5tL+Dw08rbvZ+wMX
         xNva8g87NhDz1vxU/oafoo2YnYCmltgQY4h/9gNrEIW2LeQNqh5nNp5/nkebRSzy9NDJ
         mKxZHjlIf0w+pVUM1eNdXtbwLWEP+vM1XE1vyiNz2WlQ6z1GvrXsWdywk2g8k9ksYyz9
         YOHk+5o6pKyS3uGGRhm/EXHQeOC2rHBiHCopgRDnN+GnMG1RbMxEKRCGT1LofndeZ89t
         Vlag==
X-Forwarded-Encrypted: i=1; AJvYcCXmYDxj6pDJFATRdxpClWN0XXDwtYdNxZRNBjYQ8ZQsSnhV6SH1vqX7OnsXHkYkI5d9J3LVju6ik60=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGIR7RLIJXR5oq2/Wmn1mh1Y5D6PKkKzncX47suNmRbViA37qh
	aobIh+MDoEGHFUW9Mv49pU6WRE8uUkQqauMxlvgrPPVA7nfivarBAZx3OLFAGXfXaM16fEdUy/2
	YECoujvboXhwtbJ3EpXPUwlTzLqUBw8R+PuN8B83YO3AyO5km1A==
X-Google-Smtp-Source: AGHT+IHmhsJ2wZ+FQNs6aKV1vufCR3C4a40ySZnmiOmRXAH3glcWiJ2NA4lT6jUKNG+hnFxR7msOi6nfSNhpKjm+3Wc=
X-Received: by 2002:a05:622a:2d0d:b0:456:796b:2fe5 with SMTP id
 d75a77b69052e-45d9bbdf1c7mr56261cf.9.1727979949918; Thu, 03 Oct 2024 11:25:49
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003160620.1521626-1-ap420073@gmail.com> <20241003160620.1521626-4-ap420073@gmail.com>
In-Reply-To: <20241003160620.1521626-4-ap420073@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 3 Oct 2024 11:25:36 -0700
Message-ID: <CAHS8izM1H-wjNUepcmFzWvpUuTZvt89_Oba=KaDpeReuMURvQw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/7] net: ethtool: add support for configuring tcp-data-split-thresh
To: Taehee Yoo <ap420073@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	edumazet@google.com, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	donald.hunter@gmail.com, corbet@lwn.net, michael.chan@broadcom.com, 
	kory.maincent@bootlin.com, andrew@lunn.ch, maxime.chevallier@bootlin.com, 
	danieller@nvidia.com, hengqi@linux.alibaba.com, ecree.xilinx@gmail.com, 
	przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, ahmed.zaki@intel.com, 
	paul.greenwalt@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com, 
	asml.silence@gmail.com, kaiyuanz@google.com, willemb@google.com, 
	aleksander.lobakin@intel.com, dw@davidwei.uk, sridhar.samudrala@intel.com, 
	bcreeley@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 9:07=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> wrot=
e:
>
> The tcp-data-split-thresh option configures the threshold value of
> the tcp-data-split.
> If a received packet size is larger than this threshold value, a packet
> will be split into header and payload.

Why do you need this? devmem TCP will always not work with unsplit
packets. Seems like you always want to set thresh to 0 to support
something like devmem TCP.

Why would the user ever want to configure this? I can't think of a
scenario where the user wouldn't want packets under X bytes to be
unsplit.
