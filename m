Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4257524BBFD;
	Mon, 12 Jan 2026 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228785; cv=none; b=ZA+h/yTg0cM3muxZT1DiLlWz+2++RT5j1qrbbgzHVPhIZ5gt8xp9Sq+hPR0n0Q8ySm/fvrIQIqT8Oy4KZuQKPbXgyNxbD31p9fm5N+cIj6+eUNfcilGiCE/r4236TpzrERHTGO5jZNelnGlSj1Z/myWD+GJ67fGy7v4msExkpPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228785; c=relaxed/simple;
	bh=SX7QAvT6621s02/hOC2GvAnjCmUc4TqiSigWuEXOA2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSDf+SOUGZ0X2ncRvKJjgOIZ7IRYVvibJHUqFgD+cGVcNXHZrs78hn5oQPoVIN5dtNOtzLBHATxwvm5v5BuwWU5Ys6+9iNIUIhLE2cVAL18WK7qx2mgsG4kLxhmG9Y91OifupSG54Xwt52WaMaqrBSPcCJpGK1D62hZwYpcRQUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6X4ajr7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6X4ajr7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E5EC16AAE;
	Mon, 12 Jan 2026 14:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768228784;
	bh=SX7QAvT6621s02/hOC2GvAnjCmUc4TqiSigWuEXOA2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6X4ajr7lQm5o1s5xncEMjoEmvQeZ4QgqFaloWzXXGY7E5j6tqjI2MOsbqLBceRHv
	 ikng8wzxjlEZpAXX3W24zzJ/YEbuiMj27N3A29q4vOcA9zcYggpqJlrkWYZiFU1pPr
	 BC9VikiXWTfHAPhIqGEy2m9mGaR6qN2FL+mhNn/9ecZkSZqx9SNCtuXTVed0ofQK/R
	 bcrMJ8ZZT4g+MPqYie3LYhMA8aH3t8ZjkaceUUQhM5fIdXJsMqHw+UuyAkvIMew1Kl
	 Ll8XnKxnSKYuKsWiH54POtGSesGeXC8oUtrEtBJ4DIKjwoofl6KpeilZYrX01IzYF3
	 F72HZ7Pm8/BJg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfJ54-00000000IZe-3Pbh;
	Mon, 12 Jan 2026 15:39:42 +0100
Date: Mon, 12 Jan 2026 15:39:42 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 2/4] scripts/kernel-doc: avoid error_count overflows
Message-ID: <aWUE2afYSMrKG4Kx@foz.lan>
References: <cover.1768216455.git.mchehab+huawei@kernel.org>
 <bb0bd9ecbf38f8d28749ea15f8d04fb640e0c76d.1768216455.git.mchehab+huawei@kernel.org>
 <ea13b9a9b0fbd4272db4b09564a60545eda871b3@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea13b9a9b0fbd4272db4b09564a60545eda871b3@intel.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Mon, Jan 12, 2026 at 02:02:10PM +0200, Jani Nikula wrote:
> On Mon, 12 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > The glibc library limits the return code to 8 bits. We need to
> > stick to this limit when using sys.exit(error_count).
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  scripts/kernel-doc.py | 32 ++++++++++++++++++++++----------
> >  1 file changed, 22 insertions(+), 10 deletions(-)
> >
> > diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
> > index 7a1eaf986bcd..600bdfea6a96 100755
> > --- a/scripts/kernel-doc.py
> > +++ b/scripts/kernel-doc.py
> > @@ -176,7 +176,14 @@ class MsgFormatter(logging.Formatter):
> >          return logging.Formatter.format(self, record)
> >  
> >  def main():
> > -    """Main program"""
> > +    """
> > +    Main program
> > +    By default, the return value is zero on parsing errors or when the
> > +    Python version is not compatible with kernel-doc. The rationale is
> > +    to not break Linux compilation on such cases.
> > +    If -Werror is used, it will return the number of parse errors, up to
> > +    255 errors, as this is the maximum value allowed by glibc.
> > +    """
> >  
> >      parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
> >                                       description=DESC)
> > @@ -321,18 +328,23 @@ def main():
> >      if not error_count:
> >          sys.exit(0)
> >  
> > +    if args.verbose:
> > +        print("%s errors" % error_count)                # pylint: disable=C0209
> > +
> > +
> >      if args.werror:
> >          print("%s warnings as errors" % error_count)    # pylint: disable=C0209
> > +
> > +        #
> > +        # Return code is 8-bits, as seen at:
> > +        #   https://www.gnu.org/software/libc/manual/html_node/Exit-Status.html
> > +        # Truncate to avoid overflow
> > +        #
> > +        if error_count > 255:
> > +            error_count = 255
> 
> What's the point in returning the error count anyway?

Mostly historical reasons. I used the return value during the conversion
to help verifying if the Python version was doing the right thing.

> I'd rather see some error/warning classification in the exit code than a
> count. Like, the argparser uses exit code 2 by default, so you can't
> even trust the exit code to return the count anyway.

Right now, python can exit with:

1. argparse errors;

2. sys.exit() with messages like:
    sys.exit(f"Error running fc-list: {repr(exc)}")

3. eventually unhandled errors that would rise

4. sys.exit(0) if:
    - No warnings;
    - the -Werror is not used and warnings were issued;
    - Python version < 3.6 (we want kernel to keep building)

5. error count > 0

(2) and (3) returns 1; argparse returns 2.

So, maybe we can use sys.exit(3) for warnings.

-- 
Thanks,
Mauro
