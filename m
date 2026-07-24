Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A736BB5B
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 00:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784852707; cv=none; b=dokL24eLbFjMc7Pt/IMzJVMGKl3cCuZX0ubWxtxrMulRWqE9w4OdV7t3nnDADEqRZ6SHO/PFuOYK+806M0uMqxtPswR4q9HJ+iu9bdmaRgNlUghDe69f12K+wkxonaqwpOpJtRKVM+R7oiO4xw9h/n5QD6NoHuahPqrCytEOmyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784852707; c=relaxed/simple;
	bh=ccMcpYHfkbI3aMSX/cRaKf3Pn1l35LkeDuOd1giBR1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4LPkgVNjtLKZHyhZN1AOz14z1ahUeJXpClxM5HVz04J5P+5PV/LRd/YVG8M+FsRyt1ajZ+wGF5jpJBa+LWf2dSYYP64dTvZSRUibbfOOMb7hM9JZ1z7Xxe7PBTXAEkpvn4FXuKWqHOtkwW1B6tO+IO/wrJ9Jc0xWRaZJWmiIXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fljYUSX0; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fljYUSX0"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66893db7bccso1120658d50.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784852705; x=1785457505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ccMcpYHfkbI3aMSX/cRaKf3Pn1l35LkeDuOd1giBR1A=;
        b=fljYUSX09z4UzMcv5DXWsqJKp4vwONhVGB9GdMM705GKvrDU+BMK7bSyF7uvxy1ULr
         nUIe5Omi6iWK/A1rzlIeJCAxU3KhJeKzh1ajHBM97C7LcZ1vlhSwlKXNl2AH0eXCgC6i
         doSA2R6reETEhWexf7hgM6SIFBpY4VQybEvOXiU4MSUHfpkTbQXp12ZkA19WvEVu6rMw
         liQk2986ayZyt14xuvLCRVZAoXpr9340+hItI9TjB/UE5SxhzrYmBBB4SkFA5PKQ/Q4E
         uS/hK4Yn+y4r3I28a49QK7UjYrnU5pZYphWEtm8uKC6sEdwOLUuK0QY6xY4JyMYXYGpi
         qkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784852705; x=1785457505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ccMcpYHfkbI3aMSX/cRaKf3Pn1l35LkeDuOd1giBR1A=;
        b=PdpA/kDrfA5CUjlqIDM0EQYngvN7I9CaiPIopyf/X6rrvhspAWqIaFwKj4ucUxqv7O
         K+DUXXPRzPYofM1ILNErYxGN/Hd6LIz/yR4d/9e8Z+h6LheAkjBTllq8ky1d5953LYuK
         1zKXHpBeElqpYctrBevaxqEsQHcT9akSe7AtVEtragCxqjaP4iIdu8RbCzeYRAX1Npiu
         4pMq9xBvNNIuynUTqcWT+zKZDONjvo5wcw0EXJNqyIYb6Gj47EYs6/m4pBZg87qtinkp
         M2QJQ+HyQwBzdc9KwdfK57AssC1ir9eXuy90ltYIP5OComWYvH+Xrg6HGvbl3QLLcMum
         hbGg==
X-Forwarded-Encrypted: i=1; AHgh+RrnAEDKC27xdqjK17af6a9cJz1vHj08YtEVHa+74vjzJdmGbS0iwBC/HxY2JEb3Caaolf8oUh11KEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYpJ6MyRBMRy0e278GP6TvnuLY+4PhOO0yj4BQckcdVMXsYxO2
	3/iar771zUZNvBpM8rTrU5VV3UC1OdaP5WTXsU7sRpFTwD6yYmsMa3+W
X-Gm-Gg: AR+sD12BgsWqab3Zy4z3cq6do54MQHCOh0haXFQoumbkzucozn6dicT/EGZRUCHq4aJ
	qQjjNHhowp6yH69zBJ1U+KKgIrhmTpgQFFkxdMp2dHUjWljGB1APGnMcunWbRRpYtjy2DIkga2G
	yYzoEV9cxlM6GCGDzVl49v/yVOu97frPQ1mHF7Mnqj6A4qfK+VRemYU1/FohkfoK+BJWYKeeORj
	hHYmXje6eJzX+UPpQ/HdEIQ2gJfdaOio10tq/qaXcXRWwoePe1Ma/tHZgQrhRiGFC87bEftr+2b
	OzUtZTqnXm8ZT52PrAXHy/y5s77DwuGLSfri6hBx09X2f1NRpnmee0npGUEeJn3u9jorNyxEJ+5
	Wei8UcMLYnqReziow+1daUf33ZUW4cIBfKBORUsSnOZ5X9VroBzanDESE9P9Xq510ghzFGXCNwT
	k=
X-Received: by 2002:a05:690e:484d:b0:668:9230:e269 with SMTP id 956f58d0204a3-668a4c60022mr833880d50.41.1784852704908;
        Thu, 23 Jul 2026 17:25:04 -0700 (PDT)
Received: from gmail.com ([2804:d45:3612:3b00:e1aa:6f0b:6cfa:c97c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm35847627b3.19.2026.07.23.17.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 17:25:04 -0700 (PDT)
Date: Thu, 23 Jul 2026 21:24:59 -0300
From: Lincoln Wallace <locnnil0@gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>, paul@paul-moore.com, 
	corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	penguin-kernel@i-love.sakura.ne.jp, rdunlap@infradead.org
Subject: Re: [PATCH 0/2] doc: LSM: update usage document for current LSM
 stacking
Message-ID: <amKuTh0WV1vhvA93@gmail.com>
References: <20260714013832.977443-1-locnnil0@gmail.com>
 <d14f03a6-2c48-4f96-8682-29453945b29d@schaufler-ca.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d14f03a6-2c48-4f96-8682-29453945b29d@schaufler-ca.com>

On Thu, Jul 23, 2026 at 10:47:12AM -0700, Casey Schaufler wrote:
> I've been stewing on this since it came up. We should probably
> remove the somewhat complicated logic from the Kconfig files if
> it's not adding value.

That seems worth doing, but it looks like a separate change to me.
The document currently describes behaviour the code does not have,
and that's worth correcting either way. If the Kconfig is simplified
later, updating these paragraphs again should be a small part of that
series.

Happy to help with the Kconfig cleanup if that would be useful.

Do you see anything in the two patches that needs adjusting as they
stand?
