Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F3C4369A
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 19:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708026046; cv=none; b=Q78dUvkJOI3O0whjZzeXXwmLIaifxH7LYCT5Iuf3gxoA02vSpUdP8bzUCrXyo0S8N2waBmcWvtm/O+JpHXziM9u0tKGf4LrUbGEhgMvJykCmhnpa4q17j/vS9H7gBiY8AvOGCv8AgjXxB4bxvGBmuqerjZ/tknFqgzfU3IMPHgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708026046; c=relaxed/simple;
	bh=jokuoCNs89OtbgBuZAnY+h16wX3YDNSNuOYB2bmOCdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tl9397RsgNGkkqZBInJpNPlSq8rzNHAhoT6AOgc9ROKN7MflH9NcJCq8cKQk4NjvNqcWcRA+yKDiMRriN9Q8tvsPPLFR6MCGKiXIaO3sLXTSIDvvcZIIekVhrY6LSeb6l6zMBC30+XHRK2tOBQiC0mdW6MAzbQ9YysrqsUj+nq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JNiBl6sS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JNiBl6sS"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d7881b1843so11298425ad.3
        for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 11:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708026045; x=1708630845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N45lPs3M9TrNxSLc9/f/ZRjzHt59sujwqrGC6tXBgWE=;
        b=JNiBl6sSNFysLdej+LyFOyX1xlFxK9H27wtXxtlXKL4/utIkKlaCOs0xLToapqzrq+
         naEXDSOqeGHSPkvq5MXpXtFsvskgxCJqeX8Bcb142GFDbNlxqMrKGLbK0hiWCpNd88IE
         XKFrZjr+81oI3v9C86fDJ6EFjIDUeiXCzZwVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708026045; x=1708630845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N45lPs3M9TrNxSLc9/f/ZRjzHt59sujwqrGC6tXBgWE=;
        b=kmP9pXp/QkN8P2mBbxmrrX4YQcRFKpo6fy5VwVNs2plU8SYyrrmnFTcLluPRjZAUW8
         Jx/+GvuRxriS9qjAO5ybEDvHBZwgf8w//00gJ7d7BKdzKWkx6Z3nJujH+9MJOHxje6r9
         6/7nv6pXdcKPMMk6iXRjgzWYc85H5a7UBDYjGZDeVQq85vxMBOmu6GfLJ+esLyMNZ7e9
         /inRCliEbnBr07b1kQW0CICzxBx2R3dthfbMXBi7de6yPfkH+tcd3zbkEoXiVt9ZjTpQ
         d+xaUuuw9Ra4Gfc/cq0uu6N1ai9Q29ljenEAyhYjZ6LcgybdvsaxRU+nb1NQjNxL8uCd
         zTDA==
X-Forwarded-Encrypted: i=1; AJvYcCXM7aSzV9xIBsxeTtJwLwJyQmrTYtMQuIIY3WbwapPBbxyCNhJ+0U4cNHXZPcid+JimayaG0V43366MliWOuGI+rDXmFQ0b3Jc0
X-Gm-Message-State: AOJu0YxxrKbDrj/1EUpqwRlq3CEg6wHXjgpSoCiAr8dmAeKnc4pygmCB
	TfvqvzKfkmXe32QQPBgkCqeLCXdWHBGedyQy4y2N+y+lE2zKiNRJ+NyGVfuSJA==
X-Google-Smtp-Source: AGHT+IFx9b8jYULzNHxK13eAZ7tnM5C0S0j71SlJw2uZYPQ138X7hnoC7MKrw3Y2FjevZ5APngnOvA==
X-Received: by 2002:a17:902:c1cc:b0:1da:1e0a:eeff with SMTP id c12-20020a170902c1cc00b001da1e0aeeffmr2681211plc.67.1708026044715;
        Thu, 15 Feb 2024 11:40:44 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c10600b001db2b8b2da7sm1618299pli.122.2024.02.15.11.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 11:40:44 -0800 (PST)
Date: Thu, 15 Feb 2024 11:40:43 -0800
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Hocko <mhocko@suse.com>, corbet@lwn.net,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, security@kernel.org,
	Sasha Levin <sashal@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v3] Documentation: Document the Linux Kernel CVE process
Message-ID: <202402151134.4ED3C9070@keescook>
References: <2024021430-blanching-spotter-c7c8@gregkh>
 <Zc5PycMenLBYECAn@tiehlicka>
 <2024021518-stature-frightful-e7fc@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024021518-stature-frightful-e7fc@gregkh>

On Thu, Feb 15, 2024 at 07:20:09PM +0100, Greg Kroah-Hartman wrote:
> Here's an example of what the CVE announcement is going to look like for
> a "test" that we have been doing for our scripts
> 	https://lore.kernel.org/linux-cve-announce/2024021353-drainage-unstuffed-a7c0@gregkh/T/#u
> ...
> the latest release is impossible, the individual change to resolve this
> issue can be found at:
> 	https://git.kernel.org/stable/linux/c/f08adf5add9a071160c68bb2a61d697f39ab0758

This is the "original fix", a v5.16 commit, which was backported to all
the stables. For this case, that seems fine (it's pretty easy to grep
the stable trees for the SHA).

In the case of a fix only being in -stable, what will be listed for
SHAs here? Each stable SHA? Something else?

-- 
Kees Cook
