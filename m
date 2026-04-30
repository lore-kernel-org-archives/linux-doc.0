Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B50287503;
	Thu, 30 Apr 2026 20:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777579703; cv=none; b=D/qtkoJIogDLsHgKxDn/MR9NaKWX3L9h/XpXOxpaDtwKZpYAWu0T30boe8k7hAgP9iUGE1JUyGXJ7DNRskqOaWTCC+Rr0Newf50eDsEmjPcGkZDowY9vNxv0CjpWk7B0pONpRt4HHLIN2S+ojMOKQ8tWltqEa0vQw24A0qvThkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777579703; c=relaxed/simple;
	bh=8OtbdMRbfOue839bk+sXktHATPH+3qPIOw6xZKK7DZw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=N6CKXt8c179BytcOuUXOiaVyhzcdFe1pRIPB5VGY8bRW+Otrcrqm0Ogr0y2BUMhWgOxtfiwZRc4Mm7gPV6AGgOfohfLqKSOmtbpA15s4B+D7L9VI8JeA1X/WFHZYGFjEzNNKO5qrchZ+I5xUEv3cyIJmET5jADzxo3VswtovPc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fK3MhK9k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fK3MhK9k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84913C2BCB3;
	Thu, 30 Apr 2026 20:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777579702;
	bh=8OtbdMRbfOue839bk+sXktHATPH+3qPIOw6xZKK7DZw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fK3MhK9kCdLHmMjtWZe70Ox/VtLcx3NSz+XngQeD8SAHh6U5Xxb+SzIK/UbdLwgzk
	 Em8ECR2oxPJmPfX3jYNy8Q9qopLte3XZL4Ok/jjrdgEtqYltH3xydo7DS7w2XUnvbu
	 8ie+f/pErKfXVAgiFcixIqqgN/mjFD1R9VxC2KVQFFP6SbCLnk9kCnnWt8YiBKxXN2
	 SiW+XLvwM4MVkfKr/weCw6fCVfUDZNLl+6dQvcXvVLA0cMFHPrOZ5jnaRGCFZJ6tKV
	 vDRiYK+BocU8wh+1TSFNXQAKlafmM1sfwf6j57JAV0pzR+3zlDNeGoKHz4WOoZds2V
	 fHXoOiQ9y+KIw==
Date: Thu, 30 Apr 2026 14:08:20 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Avi Radinsky <avi.radinsky@tennr.com>
cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    corbet@lwn.net, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: cmodx: fix typos
In-Reply-To: <391d16fb-5f11-45fa-8f3b-1debe095695e@tennr.com>
Message-ID: <ec533d17-0d7e-15ec-308e-0198e027ac28@kernel.org>
References: <391d16fb-5f11-45fa-8f3b-1debe095695e@tennr.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Apr 2026, Avi Radinsky wrote:

> Fix typos in the dynamic ftrace section: atmoic -> atomic (twice),
> pacthable -> patchable, derect -> directed.
> 
> Signed-off-by: Avi Radinsky <avi.radinsky@tennr.com>

Thanks, queued for v7.1-rc.


- Paul

