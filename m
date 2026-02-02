Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDEB2F25F4
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 19:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770059955; cv=none; b=q6K4cKiJ3TROkysIDHJ/wbZrQmsfjsv6hSXleX1DFoCkUAvz2dVguuMETyiAxz4AFc4gwQa8cek5ZqXDTing5iTqTCu9yD1H4bumkBLRAvD/b2zaMhjvh0VVqa8dLPqTSy9qpxFet/cC2DcM53MLVpXZsLvts7sOO5lX1GTDY5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770059955; c=relaxed/simple;
	bh=0x7jvlrx5XFJyx/jKqbZh9Z1RPvxu1cgo/tyO/MM6oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R15/n+nF7hkcuI9vygesnmCfi4cw4HVE5t6dE6GNhWcOOVA3+XK3IpEJm0Sad1VwxsQwPtfWMl9EYtl/jvr97ee7w3TijO4RbjTbxfG9skwWUIOmLmwSks/9hgSHZ3QkDT1MO4lG6Uq6h1Q/015aLmIi3z2Zv1qqLmDe+iFHKCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=U2qNsPFN; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="U2qNsPFN"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-894638da330so49170176d6.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 11:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1770059953; x=1770664753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=asmdN+eKpioswtzM18Womc5lL+dXDrk6p42YTES7X6Y=;
        b=U2qNsPFNBQhv24mlITltEayI08i1maVSDm8ByplOD+la0RGDSjY8Mv2H9n2daDnKOl
         xFGqK6Nb/SYf/KFQV9g5T0gvLgrWXOj0rxnNJHB5sOxcIP+uYUeTjRn/gdAeb7GLnWwn
         7HycReeNfTp2wqqE/Tfi3ogmFcyzVfMfWgVOyj/zWwFEN7elO76wfdRDZdPfhnnsMaXr
         FiWQpHKejx40v20H5vZ12+Z5NhinnT3aCZeXMaWsoQnruq6PiIKMdLczMmxPpszpCTxj
         KQfbsDGCEIgB0R96PatMSsngQ6AxnEQ0DmeIQ6Z5vAXVdsJHEoMaBEQ/SbsWFlsDrIeC
         6INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770059953; x=1770664753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asmdN+eKpioswtzM18Womc5lL+dXDrk6p42YTES7X6Y=;
        b=W2rcw9jNOu4WTTJdDHDtjafBIDLBKz9JIl9AmDlp/aHaL4re/tCdrbBVcP0eM+ueHO
         sAkoiHIVBnoPv10wEYr60yJiwPA1J2RTOLr5UFkFSm+3SG8gHZDp4KC3u57lYQog0fS7
         Df8xi6F4BCRmfuwtkfkEO1GLoMeuK07eZA8XUWDPTrrCCgHFrLFWh/N9+GOAdwASATSg
         3UCNRQxx92pcpKLMIsXznVoXzSygTJV5XsJoL8Walk1SgwKaOntw9gDk6Wgdq8Dd9XDd
         7C4sysF2oar3oofyzXOKOJeJXJ7A2g3Fe6awTNeV6T6H+nJADFE8c5Fbz/ewPAx/Vyd2
         oFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0oYaTvWb54FXNafVrD3z4AvoSXRQShRbxvhGOimcd9xyt1LEfE032zSYhMPhE4dyhzd/OqJbkO88=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaguWe99WMLwu5P7IyxkTCMmW7bHNlfbEll7bXJspbGKZbbPiE
	KvrPeufFYJejlF8KhFX6B5ZYTRqvtTaG3TgCvmHBFkshJEb9didp/mRPiHtR091JEeQ=
X-Gm-Gg: AZuq6aJFmQIYgLxudzzWj8GAkIiL7znznxq9e3FjtDDygVxhxPrzPa3MQxV6rb3SlBY
	S0bSAMVYGuhYGgZInqXzIk2FkQIT5bKR2DbN8UaNO0FYVfYQTmLyL2cxG9QXfTV/Lx6ucA4dP4x
	Xz0i7bgmRQPacto5faicmhyYqoO4F1ygC/rGbcHTXwUg4yhK6bJT9ZjOK4N+sdFhVSxJfUUrSUV
	I7KYG5lu6ImySz7xrL27qwMFGAKji4h7NvE2ibRdXJYHRcclVmOuuX4cH9LXXiAHRvNQXnv9hJs
	0xvhRLETw4XgejdNnzwySDmeBVNnOlpWN7wrCeA38yCclLP3Fxr6kUrH/cWZOE1fZsHcHQq4VfJ
	8K8hUcpMU5U8e8DSDEkAgpQxC7toJlCvm+cE4m39xwyfoi4eR7vTxSltNIp1LeSCYka/8CRAlLa
	q+hE8aUV9J3iH3KeGQXUekZ/b7NjKA76++SrEgq1geABcsEvR4QWtszv9ieqtLMwca97504Q==
X-Received: by 2002:a05:6214:1311:b0:87d:c7ab:e5d0 with SMTP id 6a1803df08f44-894ea096c06mr178827036d6.55.1770059953093;
        Mon, 02 Feb 2026 11:19:13 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2889asm1253553485a.27.2026.02.02.11.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:19:12 -0800 (PST)
Date: Mon, 2 Feb 2026 14:19:10 -0500
From: Gregory Price <gourry@gourry.net>
To: "Cheatham, Benjamin" <benjamin.cheatham@amd.com>
Cc: linux-mm@kvack.org, linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel-team@meta.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com, willy@infradead.org,
	jack@suse.cz, terry.bowman@amd.com, john@jagalactic.com
Subject: Re: [PATCH 8/9] cxl/core: Add dax_kmem_region and sysram_region
 drivers
Message-ID: <aYD4roMbjyBkK9l5@gourry-fedora-PF4VCD3F>
References: <20260129210442.3951412-1-gourry@gourry.net>
 <20260129210442.3951412-9-gourry@gourry.net>
 <c1d7d137-b7c2-4713-8ca4-33b6bc2bea2b@amd.com>
 <aX0s4i5OqFhHkEUp@gourry-fedora-PF4VCD3F>
 <9652a424-6eb1-462f-8cbd-181af880f98b@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9652a424-6eb1-462f-8cbd-181af880f98b@amd.com>

On Mon, Feb 02, 2026 at 11:02:37AM -0600, Cheatham, Benjamin wrote:
> Sorry if this is a stupid question, but what stops auto regions from binding to the
> sysram/dax region drivers? They all bind to region devices, so I assume there's something
> keeping them from binding before the core region driver gets a chance.
> 

I just grok'd the implications of this question.

I *think* the answer is "probe order" - which is bad.

I need to think about this a bit more and get a more definitive answer.

~Gregory
