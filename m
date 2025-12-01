Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4008314D08;
	Mon,  1 Dec 2025 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764599050; cv=none; b=Ul2hMp+ue54SQIKzh18ezTopT8kencaL98zvpjFE1pw852PKimdE7k380q2nk5HLGprfMPoP/IZhsPVmaAlFl28Y7weIto2VddT8i17+7MbypaLzrLLmYOxm36xTdx4cY+CPdMCSKHHrUY1C/329U2JJjuWlfwSVmPkgBhiHosc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764599050; c=relaxed/simple;
	bh=xkalVrhjF7JdJs4HSNy3OKWxkwPmqbC4syv9VjFF2kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlbgNp2QU9uYI7d/ep80QMxhjjM7nou8MitWIFiLJkpPN+z71QPVqxUF3rCmqFqcU43YwS2ssRgCNoQIh27CkG0Q1GAlNQ9dd34WZQXbYIfiFFUj3RKl72/qM5+Ha+l4y6xvd0HpEO0pc1cjozova0SeuQKZdgPp7K6U6a3bngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tf/vrxFk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tf/vrxFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABF9C4CEF1;
	Mon,  1 Dec 2025 14:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764599049;
	bh=xkalVrhjF7JdJs4HSNy3OKWxkwPmqbC4syv9VjFF2kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tf/vrxFkV2Qag5von9GszI6VXa4DXmSK0DlTqA6+XXE0PbH6knFbtgvXe17fuly8L
	 lLwfbqaQ/cIc4KtPDgIBAgNqPLnlz6hqqaI/ntoZVO1dQ62HXIURbpx0367evvlaO5
	 D72fJe8XoNQ+xlD4SSbbFDaFQQ7RRv9fh9EuBmb+dPTR8D7oekRNwZtBAkyF6/jYtK
	 KEWjswPu+yN7LnUfFSxgK+MW0KM1jWrf4E50vbIp54C419kIO9W2B5pBWScrf3wmsw
	 x2CSbhiHsuWGyFHckE1ujx8D/AUaHOfWe2E+0w58F6jS/L1MQa8nWP567hLSjSq7tm
	 D4W4cJtqniApQ==
Date: Mon, 1 Dec 2025 07:24:06 -0700
From: Tycho Andersen <tycho@kernel.org>
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: kees@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?iso-8859-1?Q?St=E9phane?= Graber <stgraber@stgraber.org>
Subject: Re: [PATCH v1 2/6] seccomp: prepare seccomp_run_filters() to support
 more than one listener
Message-ID: <aS2lBui4JSe3uI3m@tycho.pizza>
References: <20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com>
 <20251201122406.105045-3-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201122406.105045-3-aleksandr.mikhalitsyn@canonical.com>

On Mon, Dec 01, 2025 at 01:23:59PM +0100, Alexander Mikhalitsyn wrote:
> +/**
> + * struct seccomp_filter_matches - container for seccomp filter match results
> + *
> + * @n: A number of filters matched.
> + * @filters: An array of (struct seccomp_filter) pointers.
> + *	     Holds pointers to filters that matched during evaluation.
> + *	     A first one in the array is the one with the least permissive
> + *	     action result.
> + *
> + * If final action result is less (or more) permissive than SECCOMP_RET_USER_NOTIF,
> + * only the most restrictive filter is stored in the array's first element.
> + * If final action result is SECCOMP_RET_USER_NOTIF, we need to track
> + * all filters that resulted in the same action to support multiple listeners
> + * in seccomp tree.
> + */
> +struct seccomp_filter_matches {
> +	unsigned char n;
> +	struct seccomp_filter *filters[MAX_LISTENERS_PER_PATH];

Maybe a __counted_by() for this?

Tycho
