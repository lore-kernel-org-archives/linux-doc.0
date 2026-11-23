Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457761;
	b=C08RMhKBaU4RjbMZomFjVvbs+Qkp8mqE2EGhUdMPQbM7tXO0FkPtiohkMeQjMaQ/jafc
	 xWsM+/N3Dvhd1ufsDLPdxLah3yIwhUfjG7RP4I+0W1iNWPERoH0wv4vynBDJNZaEuQACW
	 2A58V7am1a++ouCF+iVFTDiYtJf3yLZfEkUa/wMIyA32kJS/SlcTPJhaN8ox+2l0ut+wU
	 xz/PVAPczJRDc4pb5lJLqwhJR6XinjbpaQnzXGXYtfzfN77KcHBRU/+uEOj9t1ko1JzRG
	 4Yps2wY1izdV2SGYj3sml94nX2JU6bL4SwME0Sn1fAw6FSKCTUbHgX39PrB1/qLdUMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=TFQZ5Vfgmmi8vCbKTEjvDQ3KYqVEpaJ0qjUpV/3d3M4=;
	b=GlpDOffu4syXni1gn4XckJWolMf0gnmnpFCzghfT7+QWlr7WKUl+E9fnPDHOF19wjpdg
	 WsmWN58vzMh+szAQHVVHUgY+1TWxRTEyI5pN9ATEvUxNY5xW9qlRYC84K03w7WLHwWbZm
	 rALcTPNBt2weuDh7SKo/7UlgySEy78Ht9TTUE5sS0U2yN5KGk2bGByCNXknQvFFwuFm9E
	 fyMSV6iYBBZqRG0M7TV6kVKL7Q9crQZ7hoVDvK2J9ETlcdSlmciOdht5rzgo+xXbblhgB
	 srTkADvPLgr1bWwSdCInoanJjvLSlruwGZosdy2A9foFqMyGBFW4PRtd832k9eDuLlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SnwkbDEy;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52AE606A336
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 18:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C52AE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SnwkbDEy
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f0414c1062so19937355ad.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 10:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795457760; x=1796062560; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TFQZ5Vfgmmi8vCbKTEjvDQ3KYqVEpaJ0qjUpV/3d3M4=;
        b=SnwkbDEy7R5RfHQQSfC2IHq5U5qRGFOPZ4+4QU1jhS/YzWsRlnPiO93us36lhFnc8u
         YNMjrxA7nuB4U6dKaj/v2yM647DDyn5+EKHe+cttoR4aotNCn73ospUsA4R+SShhg3c9
         qaNC/RohSxY8x+n3JgJLn+oZT1BG2OeLoZAZKjc0RhtfPNw/dBUYvibafyH67Wo+/2Z1
         GzZoB5xSDV8TLW+9QAYybiArBeGByysm5iR/ZbCPWwg2vz7nf92dBaHu6cxIaKQRNb9A
         k69ZOgu5aF6ijnNWZ7UMHNU8AFIqd3m09CkOgswuxwtxxsLKCLKWTfi7UG6lfHoLDAKd
         29ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457760; x=1796062560;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFQZ5Vfgmmi8vCbKTEjvDQ3KYqVEpaJ0qjUpV/3d3M4=;
        b=XlAwZ/jPDJr4QFjUEYUB+Um2PwPV9CTCJCCyCIIpSRzJK1OhBZYZZaYyplv46WWC4y
         6F2QEqqJIjwWcYN4b1gfi8HKSfOwU1BbaspVf4A0hBPebi9crkBVsCBZz9pzRjXHCp8m
         RQeiZz/SvicVCicyHqrAupOZX4BFO6XEWYhqdPk2y4zlm9M3hWl8WCw9gdgs9cVSwmUb
         CG1g3lP+gDP3QJDX4mkaCMq5hYyy0z8Zo2b9SZj1NUHUxDKH8u2ycosHl74V6ZFWzIfE
         rdHP0SIzl5LMDhanaAAGqqIOyiJm4Rjv1qRMcuaqEhSBjSgrYOV/3wP3qO947nolSCnc
         8MFA==
X-Forwarded-Encrypted: i=1; AL+hErH4ub3kYtrdlv/csAp7lSbA9b+12DilvstDxBkkYLz8QGtjfQdmlJ1OoXjf68uVXygO7D2xXgcXjaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kLbnBW67SSfUipYM+xnUpXTFK67QXsxuFkMTFT41E0dfRmKL6
	r814fG58oTZ1R+CdsgiXGmA+U0Yjdin/Q1abfCMAq2Rm6M51S7uqWh1vd5a5vvpzxA==
X-Gm-Gg: AZFdTZdzp1U1kgmrjNs76fiPRJ62LrrLJoTGQWUEwcv33ZaX9PT4CAixjLuEAb2hur/
	XMMwO1O3E/uqUl0dIvTw+Pf9dUPvo2sZGZCSQJNE6eI8c0K3WeFVvvnWEkVNC/S/EzfIKpXETuK
	WqQL43orM0TxtLSXLM2C8JmMqtLS7A8ai6Wag8pA1wSgYV8d0VJUlSGAnqD3tvwuU0aE9ydTO7d
	AQN4bEnwJqTkEIw9ADafKC0L1RIfAitHlGQ3KuzAnfv+NoNcum4eLUY4OiID0UDdr7gUKoMg+A6
	DIkblDI81kEv4SgYjznPy/LqWXSQN5g4yJzItBJPcIC4l4uRko/3Q+rXaqPv2o0WpsFO/gze4yW
	CFhiOp5Z6Glq/AYXp4r+xs85SOPSUcxjL0DS/NYZl7uxnEx0CfbiWXfsRArTNbK9cQfohsk7KdA
	YVK+wdNLaeT/XUxymcYCbRWRVyxYr97n8Tr2Qp6AYRJRTmXyy/lkpBE7gbsoVu5eLApCBt7VnjB
	odZ7BooCgu+BoG0yUGlmOHeTupcgVSqPxvsp0KBMZpSVqHHKQ/hdgGwETKvXNrUr4cdXLLtCnNK
	7No2/tAfgP289DNAk2/r3ttkmuq9K21T5KITbUsY1nLvOL9qu3cqYY0Pm03alykv
X-Received: by 2002:a17:903:94b:b0:2f0:3618:f170 with SMTP id d9443c01a7336-2f03f1acb10mr114729435ad.66.1795457759518;
        Mon, 23 Nov 2026 10:15:59 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm57723715ad.58.2026.11.23.10.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:15:58 -0800 (PST)
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
Date: Mon, 23 Nov 2026 10:15:58 -0800
Message-Id: <DN2SNNBMY48X.2HS6KSB38QPK3@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-mm@kvack.org>, "Alexander Graf" <graf@amazon.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Christian Brauner" <brauner@kernel.org>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 09/19] mm/shmem_luo: Leave freeing the preserved
 state to finish()
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-10-dmatlack@google.com>
 <2vxz33sv3ef3.fsf@kernel.org>
In-Reply-To: <2vxz33sv3ef3.fsf@kernel.org>

On Fri Nov 20, 2026 at 3:55 AM PST, Pratyush Yadav wrote:
> On Wed, Nov 11 2026, David Matlack wrote:
[...]
> I think some of this is already fixed by [0]. It holds the folios until
> finish, but only in the success case. On failure to parse seals for
> example, it leaks them. Except, as Sashiko also points out, in
> memfd_luo_retrieve_folios() the folios are freed.
>
> I don't think this is strictly related to your series so can you please
> send something on top of [0] to fix these bugs, and perhaps drop this
> patch?
>
> [0] https://lore.kernel.org/kexec/20261110175855.2437084-3-pratyush@kerne=
l.org/

Sure, I'll drop this patch from v5 and send the fixes separately on top
of your series.
