Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB226F2AD;
	Fri,  2 Jan 2026 20:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767384811; cv=none; b=LTAD0CTW6tMabHeCp+sTDqH7oj2YygwQUKUahjtWz5s+KZYzksUDLXTGkdXjd7+O48aCcjAZ6MD5qgEgx8BT0H2mtm5+9ZxkiF5QZc9sGGHxp8ZIVkh6gNyFNHOs/Ds4ljuKfhRDRPM6uWBE3f0OVfhDf8JOMOgKhd4PYCLwFSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767384811; c=relaxed/simple;
	bh=/WUKbo/QKWZtUx6V3ZDWcnTxnaa1vZNuhohUaGjdZLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooiVtC4852t1On7S5tCWKZ7CI57XbT1nRvcdvlXYep8KSvROndY3TqGeZSrjaBbuPNFH95YbxcBqX4u24c/24FmXIIvdbayk5X79NbbF200o4Ap22EfSTVl2kUaSBnyQfhBZLx+nrT+oTPIRpPuXOfNg8U8j/G0OQCoTYusSwds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JJq17W+7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JJq17W+7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hc6CfL0I4XXVQ390VORG8kEeI7lvNV3qmjgIaSJkgGg=; b=JJq17W+70Y+ACD2zFt8Ck7Ps4n
	d5wZCAQO+VosUCNZk1EQHHExwGfJevOQMMZhMgCj581JyNFymB3U+vchyBu1scwbeoRZtSE5hJ5+V
	xk9yW6/4Z+uaxPZSce2gi8Kk9hvCqctBU3oMwix5PBxf8lUWy+jAtmH6F3DC1OkpVikUQ4Sl85bqu
	CV0C5vh+e+3M/Evdro7bF8Dzodv2J1gW7eWJUWKulNCKJPiqWIIDOeH+L3TmBXyzBD3Sbn6fTtwjj
	yejMpk34ddTKmM3kNitqdelIypgdkQ2IoHRx1OriYc26enqZCYMUC5xABjyoV8223LvXH363qCPJ4
	a2sdx5PQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblWX-00000006uQy-0N4G;
	Fri, 02 Jan 2026 20:13:25 +0000
Date: Fri, 2 Jan 2026 20:13:24 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: find-unused-docs.sh: fixup directory usage
Message-ID: <aVgm5D4EvDkS4TMk@casper.infradead.org>
References: <20260102200657.1040234-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102200657.1040234-1-rdunlap@infradead.org>

On Fri, Jan 02, 2026 at 12:06:57PM -0800, Randy Dunlap wrote:
> The recent move of this script from scripts/ to tools/docs/
> did not account for the 'cd' directory usage.
> Update "cd .." to "cd ../.." to make the script self-correcting.
> 
> This also eliminates a shell warning:
> ./tools/docs/find-unused-docs.sh: line 33: cd: Documentation/: No such file or directory
> 
> Fixes: 184414c6a6ca ("docs: move find-unused-docs.sh to tools/docs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Hah.  I just committed this same patch.

    docs: Fix find-unused-docs.sh

    find-unused-docs.sh cares about which directory it lives in.
    After being moved from scripts/ to tools/docs/, it emits:

    ./tools/docs/find-unused-docs.sh: line 33: cd: Documentation/: No such file or directory

    and then claims that all files are omitted from the formatted
    documentation.  I opted for the simple fix here rather than trying to
    remove that dependency.

    Fixes: 184414c6a6ca (docs: move find-unused-docs.sh to tools/docs)
    Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

You posted it first, so:

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

(feel free to use any parts of my commit message if you prefer them to
yours)

> v2: correct subject line typos (2) (arg, kbd error!)
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> 
>  tools/docs/find-unused-docs.sh |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20251219.orig/tools/docs/find-unused-docs.sh
> +++ linux-next-20251219/tools/docs/find-unused-docs.sh
> @@ -28,7 +28,7 @@ if ! [ -d "$1" ]; then
>  fi
>  
>  cd "$( dirname "${BASH_SOURCE[0]}" )"
> -cd ..
> +cd ../..
>  
>  cd Documentation/
>  
> 
