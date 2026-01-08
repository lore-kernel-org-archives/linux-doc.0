Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC114A94C9;
	Thu,  8 Jan 2026 11:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870306; cv=none; b=fBY23nSoZyqliU/6zlzlL59qYXmkx4p0Y24fjl2L4cMUc1NlGyG0My5vwA3iG6/+VDqKBhee079/dcKYDoc7NXCNVoC8LC4kYZeiGO36r9Zvz//cpxdtApdywtwr4LJIz8jzKcZAVZmxTGGuNMjFc2CzZvESf8qjVO1iIOpUego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870306; c=relaxed/simple;
	bh=23JVHZ0/2OEkjIcgisBJ7Un4pP/D/Hxa/fPIdJ7wvf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4ZZTwdapGhU2J5ufR5SxrDPjFw2jJPp+91ABW5Ti/YEaXS4PtK7MP2j2/OmEVCH++A9/CAqQqK1/lOY/0c0eotpvC1FRnZbL7op1kwGTCT5nVLc+yaiHwC9g6N+dhJRp825j8Nd8blZFB+c4fDB7/uIUOVGcEZfJjNBzvSNjoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KS0hLR2w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KS0hLR2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E4FC116C6;
	Thu,  8 Jan 2026 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767870305;
	bh=23JVHZ0/2OEkjIcgisBJ7Un4pP/D/Hxa/fPIdJ7wvf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KS0hLR2wWf5XDAL/q5h13/NVyPKY+F5BKNCq8VYqmgn9mw+Hzh/n/YfYT3j65x547
	 IpFCFrHDp6ubyOZ0KO9R216UX282QLvH7e3UtvxK2APm6IApcPxASfk1nxK5YfV0ZD
	 /3XiyY1rDIaE/5ILRjvFBwVg1L6mpyjV4XuftLBOGF70VwQ2tDieYm1Qb3rZ8iuTrO
	 1IkJKD/kuArIZZLIVebbz/YLmejLcO5YDLwErGEa2rBuVEqBy53iW+f84neIyu9cQi
	 na2qNC+a181hIYgD3wEq7S95TVV9Ahuv4JYbcRNkkMF384DzwMBTGCORltruyojduY
	 EE605jvqCgrAw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vdnp9-000000032lG-1LGD;
	Thu, 08 Jan 2026 12:05:03 +0100
Date: Thu, 8 Jan 2026 12:05:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Changbin Du <changbin.du@huawei.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2] tools: jobserver: Prevent deadlock caused by
 incorrect jobserver configuration and enhance error reporting
Message-ID: <aV-ON47dz0aa-wzu@foz.lan>
References: <20260108100403.2888782-1-changbin.du@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108100403.2888782-1-changbin.du@huawei.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Thu, Jan 08, 2026 at 06:04:03PM +0800, Changbin Du wrote:
> When using GNU Make's jobserver feature in kernel builds, a bug in MAKEFLAGS
> propagation caused "--jobserver-auth=r,w" to reference an unintended file
> descriptor. This led to infinite loops in jobserver-exec's os.read() calls
> due to empty token.
> 
> My shell opened /etc/passwd for some reason without closing it, and as a
> result, all child processes inherited this fd 3.
> 
> $ ls -l /proc/self/fd
> total 0
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 0 -> /dev/pts/1
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 1 -> /dev/pts/1
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 2 -> /dev/pts/1
> lr-x------ 1 changbin changbin 64 Dec 25 13:03 3 -> /etc/passwd
> lr-x------ 1 changbin changbin 64 Dec 25 13:03 4 -> /proc/1421383/fd
> 
> In this case, the `make` should open a new file descriptor for jobserver
> control, but clearly, it did not do so and instead still passed fd 3 as
> "--jobserver-auth=3,4" in MAKEFLAGS. (The version of my gnu make is 4.3)
> 
> This update ensures robustness against invalid jobserver configurations,
> even when `make` incorrectly pass non-pipe file descriptors.
>  * Rejecting empty reads to prevent infinite loops on EOF.
>  * Clearing `self.jobs` to avoid writing to incorrect files if invalid tokens
>    are detected.
>  * Printing detailed error messages to stderr to inform the user.
> 
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> 
> ---
>   v2: remove validation for all bytes are '+' characters. (Mauro)
> ---
>  tools/lib/python/jobserver.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
> index a24f30ef4fa8..8206e4c1497b 100755
> --- a/tools/lib/python/jobserver.py
> +++ b/tools/lib/python/jobserver.py
> @@ -91,6 +91,10 @@ class JobserverExec:
>              while True:
>                  try:
>                      slot = os.read(self.reader, 8)
> +                    if not slot:
> +                        # Clear self.jobs to prevent us from probably writing incorrect file.
> +                        self.jobs = []
> +                        raise ValueError("unexpected empty token from jobserver fd, invalid '--jobserver-auth=' setting?")
>                      self.jobs += slot
>                  except (OSError, IOError) as e:
>                      if e.errno == errno.EWOULDBLOCK:
> @@ -105,7 +109,8 @@ class JobserverExec:
>              # to sit here blocked on our child.
>              self.claim = len(self.jobs) + 1
>  
> -        except (KeyError, IndexError, ValueError, OSError, IOError):
> +        except (KeyError, IndexError, ValueError, OSError, IOError) as e:
> +            print(f"Warning: {e}", file=sys.stderr)

I prefer to use, instead, "{repr(e)}", as it will tell the type of exception
that happened.

>              # Any missing environment strings or bad fds should result in just
>              # not being parallel.
>              self.claim = None
> -- 
> 2.43.0
> 

With that, feel free to add my:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
Thanks,
Mauro
