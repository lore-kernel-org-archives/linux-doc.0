Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0712D3358AA
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 17:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762364046; cv=none; b=susLfKu8dWGAeQiEYjJst3hJ6x8DpqYBrysoLC61wR2IQ2dKE/KTgpkkK+IOdBvQs71cLWE6aKQnCIR9J2509h7AawNShbgTpxAekCbEWJIzq7O0sbCIfHKkHLo6ArYNz6kmFitSBUX/jCIAaOR6bWOQXrSU5giaIWzVtlLfiJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762364046; c=relaxed/simple;
	bh=6xrOD9swTEvrak0LhMfPK5DhY7OUNnrkGwLHcRPL30A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4m/VdTGxq0keNxCrKjtKpDNSoJrVrKHBJyTQMVlehI32aaEgQCWOGeBDkHmzWyPsHxw6z4rWtRTr9YuOozgJvB0MOuUrPNF1DzPteSiBeB5rGm9G6rs66IADgdJ/SFTC4ggQtHNREy8dSjHday+P+hzkZffrBIMNwpgHOpoA50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caKRYsdt; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caKRYsdt"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7a226a0798cso117330b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 09:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762364044; x=1762968844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lKdKuNfm1Kcem/uHM3VQr6qkYp9rA4TSkaTwtykO5t4=;
        b=caKRYsdtvKllX8CzsiFUc4zpvhzFGohX2iqu8C541hMlaAlV/GArvWcuIUYcNzqtFF
         iZsHa2KgnDOjipZbTsQBxz70O3SdbGvGjErHJFacdd81mG28AvBExOrrIYqB5rnQayHn
         Wlp+5I0CQOH51sTOzZtXst6d/KqjDDh1X2QbZ8V7+8o8slZTSt0YSBChAZC/EWTvN8Xc
         /1bOn/adVeZxgrjzguPfyLMpPT00DAZT15nxWOuBBxWcT1Wo5M5hagVt+GO3LNGUEdqt
         7a9vvGBNhOBjTjs742uZ0lKVPnpPTnpKMyYukgbYWlYody/AKXX+XGmmQPruLqbEEbZD
         mgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762364044; x=1762968844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKdKuNfm1Kcem/uHM3VQr6qkYp9rA4TSkaTwtykO5t4=;
        b=bQWEucp2005t0y8XFVgZuNLunZUmWvZ/p7wtY1Qx6rGSirZdK3wjaChucq9Me2gSvk
         49JpeFkJZWbHKdfDCuYg6jNRWiE+dwn5gogJFf6gZH4zBXl4ZrKO4m97srCTswNsIhwv
         orIk0D4f/O5dmJKNop+/OTXeiI8FGrUKizm+t2sgiwQ4B6lSV4vjzZUny+uEzTZmp39z
         uSEkqrUPJzcqF9y9ePOB7M/8EWV76uz2ZpdQ6sK9NGe/9sJ2+Mee2b/TyBzadR3OebLC
         TW/v+03OnVRYCvviYEqaLKZQY4I+DSYvkqah4LZ9i9yFElREvncg6bWr+pDp2nywFxm/
         hE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmDNQWSPGItehw9uZveYPtb7dxDf5aRUFPNT++6plkjkwvMDN19CDmpDV6N8fZuBxWLq9O5GuhYjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQAOgVS7qbqSWsA3QR7XHpDIRG/IY0r5idgg/G9bGXzyuAPWpK
	DZQMHVSMlfBIgI7OtTBGwPSzLZVKDNi8sCVMdNXUdRCEASWEFCwa4/U=
X-Gm-Gg: ASbGnctHabB+7T/+fuaYvYXKVhT1Bm1URk6sFsW2NCl4QOaCh5KG7+qU++CBBvwyi+9
	FoOAHMBGK7ceZztahejPmC5FxxrF2zW/3zZiSsS5d6EW5GQ1z4Weh0/lwSn9gA6ZEMj/Cq/9rjR
	ilwr+hU5Q0vBZoK1B/iCXtsAV8ffhMPfGeoeXJ41E5rjgPi3yVPfaPzcVu7h8KzdqZwkrr5/92W
	zIcLDqWOM7brs3o0r+HBy1SfuP/MstH4N7mRWMNwnOm7YG8EY8MkyLCrtekJ5o7JNDcd+pdK+h0
	SCoAPnTb/eOOUeJPdlK4QdyUa6isZiPc6fWuIHRYHOGaDKH2R3Owk3odYCBmoX2KGFk/xoGUZt8
	W1K1U7C1qVtUHxllgBRhpQURsBpUtzx4/cmsbRKCCO0qz0OHNyQeRlyQqok6Y8+GsFHV3EmNsPE
	9wqrs/GrLBhm1E85Qg6jFwgI/zZzpI9mODtTKP6S4WG03m5xt8dbWwGIiDY0DIjANe8NAbZevRR
	ugTwWhvMmtgcsyspTNXA9U9sUWpofngTkuiE8FXdYOf9zg4GfYA6byNIx4s3uF6w04=
X-Google-Smtp-Source: AGHT+IGfpYym/+ciEUpgLGEk2Uo4k9tfz1NW01FXx3zpjWrnBawbwhix8S/o00+hWVYZ5LW7eOMiOw==
X-Received: by 2002:a05:6a20:7d9e:b0:341:262f:651c with SMTP id adf61e73a8af0-34f84afbef9mr4621605637.25.1762364044019;
        Wed, 05 Nov 2025 09:34:04 -0800 (PST)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f2a8044dsm6027302a12.16.2025.11.05.09.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 09:34:03 -0800 (PST)
Date: Wed, 5 Nov 2025 09:34:03 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 5/6] net: devmem: document
 SO_DEVMEM_AUTORELEASE socket option
Message-ID: <aQuKi535hyWMLBX4@mini-arch>
References: <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-0-ea98cf4d40b3@meta.com>
 <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-5-ea98cf4d40b3@meta.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-5-ea98cf4d40b3@meta.com>

On 11/04, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 

[..]

> +Autorelease Control
> +~~~~~~~~~~~~~~~~~~~

Have you considered an option to have this flag on the dmabuf binding
itself? This will let us keep everything in ynl and not add a new socket
option. I think also semantically, this is a property of the binding
and not the socket? (not sure what's gonna happen if we have
autorelease=on and autorelease=off sockets receiving to the same
dmabuf)
