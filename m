Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05BB397E9A
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 07:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905403; cv=pass; b=f/+/UPXo+m6y3DH6NXC53GPy1jdm8Kov5pAanZlYsA8zFDUZ+Xw1QZ/5rYT8DJtyarijg2RwlWIuMvFC2zj7yk1/xcML8i1HVC+WPFYlbyFt8tQZYnmclaz7gD3RyYh9aOxHEUcr5b7sSPrHWBZwoQHOYZqsYOlyUAA4q6SJioQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905403; c=relaxed/simple;
	bh=v7MhUyKLpco5Pty2ROnWb6vWgtSRv98FtHcFuzCTDt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KY0qz6r3PiJBqoiR1khM9jMcmlxivJI9J8ELsCfqqYPuOCV6moo+7EJan5Hm6+2xurcB/0moLMNMVbU0wKlx5tKJG5VzEENSjJOXcYxoB2LmZaTNk6Dy5lvpY+GP6ZIe25Or56tx4SUfCP7zc34TSgbvkYyZWZHmmfaEhuyJlvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SibH7Gmz; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SibH7Gmz"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so527160a12.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 00:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780905401; cv=none;
        d=google.com; s=arc-20240605;
        b=jgquHYEpi4lUsCBxCmU49Ai+a1zXTYNdgeViX1kvq9MnoZ9M9VXpb3E6OFHULZj7WU
         qdvffgXn8P7wU/yuh+rpgJMG/ZdOtGO5MbyPH1tloAeN54GaoZWtHaq6hMRqHv9k7Njt
         tYgz0Hz8dbeQlcDXMl/u1LFTQ2Vs0VcOaM+VVtRb6Ff8f3aZSl+A/vfR26R+SVw+w0r9
         ysDzEG5Z/lWtD5m3nBDyFVdCBeTa+eLxWmiT/jIZHGOjbpkLDO+u39kIqFbBXGSkpv9k
         ImLHFBqgWP1/NXesFuXS/8fV8/7LMAa6Bb69UfNg9U0a3a+Lo4kD+yRVdJDTyYKDvPt8
         93JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v7MhUyKLpco5Pty2ROnWb6vWgtSRv98FtHcFuzCTDt0=;
        fh=jxTTZj/PRrKNX2Ua3Qy+rIhaMGjfFPWK1NYOkFNwIus=;
        b=iJV7neFoioaqIAYVbVYXv/DjWuiPVb7QDtkLT/GqE/TF4nr4le2Ow8DmJWc3kvMeJZ
         F4/Pn8/NkxYcXrW4wAMskoWPoEiPpzyGutSaiJJTwKSs0w1qu0yUwYEjRG8G/LhgWLxD
         hGl+11Kucz1XT9eJkI54IKA5U0Ob1B5Lg2umCqDaH6cR3tO3dTfpXR2340PHKl7jZA0X
         +Q2BeklicdW3mWChLLuXpTSrwfX+3JbK4g81mRn80eyb1I/qq2WpnSJJt+3yM+APtCqj
         1MgL/gfjCLjZCrunK5rh5YqKUDWIj2te9au3dlpwO9RO+1knZvWJ/4vhNTsXwPGHDyxb
         ltng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780905401; x=1781510201; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v7MhUyKLpco5Pty2ROnWb6vWgtSRv98FtHcFuzCTDt0=;
        b=SibH7GmzNgkR6oeMTY/ftMT89eYk5qojSEXtv7wBe8+YVD7wVrj1mwK3NNyQzT3RRE
         PtrKqhDaOq1x/3GkjxYJwl3VZ4HP0f2zcOiEJMUfNChjt8BFO4Orn4DNnYqm9ur+jOJK
         m62Q9kk/I3XPiZ0OFdWD2Yq+HJX7od2Qe4ioPMXDFl1x+/2Vca7UtKr5m05wa7g0An9o
         vnA7IVQvojkIAAT9/wRWvsXsp7PZC89lEDMT0xKmhr+9a4nvsqAPBRCerQQCYccrPwiS
         lCAW/uHFCHhPCVU3cCSxRqjMqkL90nWLCfWin1YmQLdh7iyPgxwr96y2+Rg/EVvEJ5Xd
         UhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780905401; x=1781510201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7MhUyKLpco5Pty2ROnWb6vWgtSRv98FtHcFuzCTDt0=;
        b=jJIMK+ht71anOmNOG3zkhd5cufn69+Lpzm8kW+/WaIild9lK4TgtCtLJP3kYHIMUiU
         5nof/tiMX0rQ/Bql+DHbkgu8E56F640Vw0I4s6HiIyDPEyIqV7D4OA9GZWwtfEUFReEU
         1NwNWUgG24W6HBpOQIlZdsneVD/+GVaRnMgu7PX10T8oe6/RDmiOJzsg71zLXW3r+y39
         Cc6z4P7Wyn0fLEG1xrXlEb4HP2CtKmq/3exx0gU90CeClpqtbnTgOE4JQJZdhnD/lDsc
         1JA4DocJ+7UTh6yyjrNM+d5Yb4yAXAMtZ1cqUd2qkJvXVldRvrFfD+rmIFRf5eHleMPm
         aXOA==
X-Forwarded-Encrypted: i=1; AFNElJ/9Xf8evoVC+yypCdB05Dv/rB+fObHZ3mmQRUPsPmqhuhukFl5R43jbwJRthrvIMSjYuHRB8R528Fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTf8slWjjUTqgcWCzp8adIZS54vfaOS8ex5+IGSqz0PHecSMMb
	cb6DJ56l7CBPaBYtF7EqUObBt580CXKbYRGkzVO3AcWx77U/640kwfLcQUSJsVSf6QAHJUpv4VM
	f0hJjjJHwA0yE9/ZnDWd7A9jnuBz7huYEsz43sSi/
X-Gm-Gg: Acq92OG8IeBzHNs1RtVFObzZCrehCjkj9XvIeD/uVUxmE6hGZb8Bw7N7kv71DwHFdYA
	nm/Nvc9hSlNqs+IDGcY0fH5hHhjEHW/gqH0esslb7zAcopjHeLzR4GmrN/d4kSagJhCuAimQ4Jr
	lmeZU2apGhk6xyzhspRiGFzgOsm6bArs1S4F8bMGWZB48TcRoX0MWeIfQ0Ou1tpKbjTpFoc4TvP
	A5MY4Wh8H02GTdPFDc0/YOZpJSMQmctfavMhx7IKUeOqZ8hzcglFycTCv41j+gRyPa5ME8eGY7+
	UGwOZP1ownzDjfMEG7h7JruuXFzQLLpXNQsTWjQKMsznyJ9y2u97QphbIA6yPoTFsVuxT6/cNl7
	C9ZTtqkWfxlFjICuACw==
X-Received: by 2002:a17:907:96a1:b0:bd5:ca8:768c with SMTP id
 a640c23a62f3a-bf37234aa66mr653540266b.31.1780905400661; Mon, 08 Jun 2026
 00:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606155856.15548-1-med08elkadiri@gmail.com>
 <20260607070645.9559-1-med08elkadiri@gmail.com> <7906bad7-4e64-40c0-a724-f55ac44e12ab@kernel.org>
In-Reply-To: <7906bad7-4e64-40c0-a724-f55ac44e12ab@kernel.org>
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Date: Mon, 8 Jun 2026 08:56:29 +0100
X-Gm-Features: AVVi8CcGNyoLbmamtMoNx2-0ZzTmIKgNBdQkv4HaB4rzJNFkS3LOZowcqOrQKLA
Message-ID: <CAAMeuQQFgyS1KR9tG_fW3yXhftmt1Oo7wALnc4WhnNuRG0x40A@mail.gmail.com>
Subject: Re: [PATCH v2] docs/mm/slab: document cache isolation with SLAB_NO_MERGE
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Kees Cook <kees@kernel.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vlastimil, Vishal,

Thank you both for the honest feedback.

Vlastimil, understood, I will drop this patch. I can send a small
patch adding a comment above the SLAB_NO_MERGE define if that would
be useful. Otherwise I will focus on code contributions going
forward, written and reviewed manually. Appreciate the guidance.

I will follow Vishal's feedback and send new iterations as separate
threads going forward.

Thanks,
Mohammed
