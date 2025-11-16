Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803E923958A;
	Sun, 16 Nov 2025 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763288942; cv=none; b=ehheWXge2NguKLaY4Iml0RX7Ox9teHQfvv+cVuy0HcS10/pvtCmSQwgP9MeAXFBCu1fFgrj9+rCeJ9dHFQwdMdYjOSYnq7k0LuewDowzoYTmienwzFOFKLvoFcP2AAwpj8f3oLyn3h1DN2Y//fjMSQXgzPc9Z36ah5QxjwP5XNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763288942; c=relaxed/simple;
	bh=hSohCs0vHznEumTo5L9LBmjsj2nlr8Ol/TIiiKzn/uY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UhVaOt2p+UPVN2GryFK2oDbG943AnED8oY6ddSMLFiv2IRZRQNsZY7Zcnormd1vupI8sqA7lIblxrwKXVfUAFLdU9JGpSofKd92SHu56wr+6ru6qiQIPsXPmzXu5rkBISf+9DpV4gXmmxL29+anBAmixEjjXYVp+LJPMGWdx3AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jua85nNw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jua85nNw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2442C4CEF5;
	Sun, 16 Nov 2025 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763288942;
	bh=hSohCs0vHznEumTo5L9LBmjsj2nlr8Ol/TIiiKzn/uY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Jua85nNw3trQyuWgz9YGCVAAyf8vspm7nzT8f2TzQ4eCZFpBqMGfKGjrEbdOP+WE+
	 V3cGuaO/Cmg9hzCSkdBmAdjFO1gFfonLQyNq2rYptwiUbupLJ9zslhK0nRO8JbvpBu
	 zPbyNXXYm+uSDgy1F3QNnHATAdvQ0iGV5mzQEtTR+PFgoXyoNLdWFKhB3svLxFTidV
	 GSO8+1XIa+O4taogfGTXJ7o9Uv6VRzIksv5Iz8MB9pvgC0bts5xDL77H0GNg9YZN3e
	 Q4PmbEvYNlDzK+9tHHbqsclYKw1tx6T3vR6piHpq+tsuM/rLv28C00WTuYWexkT15W
	 aTC9hth9aUYlQ==
Date: Sun, 16 Nov 2025 11:28:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-kernel@vger.kernel.org, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] kernel-doc: add support for handling global variables
Message-ID: <20251116112857.157acd6d@foz.lan>
In-Reply-To: <21b98e7a-93ae-451c-b7a1-e1468e8da0ca@infradead.org>
References: <80f85eacc306e62de8c9c68712c653ba290c2ff2.1757262141.git.mchehab+huawei@kernel.org>
	<d85e3f24-dbcd-4f28-b31f-a77661fc66fb@infradead.org>
	<20250909215824.1968220c@foz.lan>
	<5dc41508-43e8-4e80-b4e0-149af7bbdf19@infradead.org>
	<20250910010903.5388bffc@foz.lan>
	<0d190bf0-b9d4-4d5c-a1cc-6d5d79be3886@infradead.org>
	<656591ff-fa7d-4763-8759-0a0af3a4039a@infradead.org>
	<c195c68f-e815-4428-9134-8746198a4611@infradead.org>
	<20250910062323.059bb078@foz.lan>
	<14133b75-a984-4244-a18d-f02f0b81d1b7@infradead.org>
	<c5262290-38e3-4c48-af00-b91f03a065a8@infradead.org>
	<20250910105454.6a6c57e6@foz.lan>
	<21b98e7a-93ae-451c-b7a1-e1468e8da0ca@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 14 Nov 2025 16:50:57 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> The v2 patch certainly is better with the new regexes to ignore.
> I have a few minor changes that I would like to add (in a trivial patch below).

See my comments below.

> And there are still a few cases that are not handled correctly.
> (see my kdoc-globals-test.patch from 9/9/2025)

Where is it?


> Also, changing to "var" instead of "global" is good IMO.

I'll send a v3 with the rename in a few.

> ---
>  scripts/lib/kdoc/kdoc_output.py |    2 +-
>  scripts/lib/kdoc/kdoc_parser.py |    1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> --- linux-next-20251114.orig/scripts/lib/kdoc/kdoc_output.py
> +++ linux-next-20251114/scripts/lib/kdoc/kdoc_output.py
> @@ -808,7 +808,7 @@ class ManFormat(OutputFormat):
>          self.data += f"{prototype} \\- {args['purpose']}\n"
>  
>          self.data += ".SH SYNOPSIS\n"
> -        self.data += f"enum {name}" + " {\n"
> +        self.data += f"{prototype}" + ";\n"

This one should probably be a separate patch from you after the
patch, as it is related to enum, and not var tag.

>  
>          if args.other_stuff["default_val"]:
>              self.data += f'.SH "Initialization"' + "\n"
> --- linux-next-20251114.orig/scripts/lib/kdoc/kdoc_parser.py
> +++ linux-next-20251114/scripts/lib/kdoc/kdoc_parser.py
> @@ -939,6 +939,7 @@ class KernelDoc:
>              (KernRe(r"(?://.*)$"), ""),
>              (KernRe(r"(?:/\*.*\*/)"), ""),
>              (KernRe(r";$"), ""),
> +            (KernRe(r"=.*"), ""),

Makes sense. I'll add it to the v3.

My suggestion is that, once I sent v3, you pick it at the beginning
on your series and then add your changes on separate patches
after that, including the one using "{prototype}" for enum.


Thanks,
Mauro
