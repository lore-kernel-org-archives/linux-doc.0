Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64A22C9D;
	Wed, 29 Jan 2025 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738159580; cv=none; b=iaPdvs0wTjmPQneN+mVf3So7mw6vsCOJD8ztaL8eq5H7kAF3c6gYhF396yqnmgcC+ov55xIgTDn+pO+y2QPmpsZqmESV8Jzs1s++rMFF7RnWlhobeOjjr+XWf6+qkVshho59aaygJGP4GIvSssLhyD+at/eJtRZOP3MNeFUOPcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738159580; c=relaxed/simple;
	bh=muf2oYQzvCFtPKT/pT090j8pL5+jj2hSnSgR4J/NKMY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WrRHGMHCe6Uhwj28xdWXhRMqEcUwrpwHjOYbA6+2FReBM/1weMFBewqazE1IgnQ0gTrkV7tT4MO2ivu1dQRZYIg6Jk865fJk41MP/xug2KjXntL1xWpFHlzhwCgjITYGx5Mx80FrkvgILy9x3Gsx0XgaJIHYUpa8zbMmyk4L89w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXeEFB2s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXeEFB2s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A9CC4CED1;
	Wed, 29 Jan 2025 14:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738159580;
	bh=muf2oYQzvCFtPKT/pT090j8pL5+jj2hSnSgR4J/NKMY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sXeEFB2scbhNpPOGt+GA74O04tAvOt1iwZ0K1mSma1vyh3IVIgkIVJV3FJ3n+xwCa
	 +dPJzYY3YVHtEwh52xfctVnEUS42tGyqRDmq5TyCHT3RzRAw3wnwLvZIijiNuYUX6W
	 qiWW8UM76hbHQ5CEj17kzxtj0ejVJe9SyG2mR3ELdwUrVfAMgp+DKte9Qk27Bi2y9v
	 kkq7zvmquLudjfTwaG4zpddI9XQ6xV6jDiqBvd4dhRHyZe6pjoR9aeJiSSgG9E5AQD
	 nESPx9mpSoEJAd29XuaW2JyEppu0ywg2519alF6AW/fXq2F/Qj5JfTEY7TUjWCm7X8
	 U0UZHILrPM7XQ==
Date: Wed, 29 Jan 2025 15:06:15 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: corbet@lwn.net, gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 17/38] scripts/get_abi.py: use an interactor for ReST
 output
Message-ID: <20250129150615.1c256acb@foz.lan>
In-Reply-To: <2d4d3fd1-5fe2-4d18-9085-73f9ff930c2d@gmail.com>
References: <72a53ca85e554b0c1fb90488d55aa62ec1d7defe.1738020236.git.mchehab+huawei@kernel.org>
	<2d4d3fd1-5fe2-4d18-9085-73f9ff930c2d@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 29 Jan 2025 20:04:42 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Hi,
> 
> Mauro Carvalho Chehab wrote:
> 
> > Instead of printing all results line per line, use an interactor
> > to return each variable as a separate message.
> > 
> > This won't change much when using it via command line, but it
> > will help Sphinx integration by providing an interactor that
> > could be used there to handle ABI symbol by symbol.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  scripts/get_abi.py | 52 ++++++++++++++++++++++++++--------------------
> >  1 file changed, 29 insertions(+), 23 deletions(-)
> > 
> > diff --git a/scripts/get_abi.py b/scripts/get_abi.py
> > index 73613fb29c1c..2aec1f9dc5aa 100755
> > --- a/scripts/get_abi.py
> > +++ b/scripts/get_abi.py  
> [...]
> > @@ -470,9 +472,9 @@ class AbiParser:
> >  
> >                  if cur_part and cur_part != part:
> >                      part = cur_part
> > -                    print(f"{part}\n{"-" * len(part)}\n")
> > +                    msg += f"{part}\n{"-" * len(part)}\n\n"
> >  
> > -                print(f".. _{key}:\n")
> > +                msg += f".. _{key}:\n\n"
> >  
> >                  max_len = 0
> >                  for i in range(0, len(names)):           # pylint: disable=C0200  
> [...]
> 
> Testing under Ubuntu 22.04, where distro python3 is 3.10.12 and
> distro Sphinx is 4.3.2, I get this exception by running "make htmldocs":
> 
> Exception occurred:
>   File ".../linux/Documentation/sphinx/kernel_abi.py", line 48, in <module>
>     from get_abi import AbiParser
>   File ".../linux/scripts/get_abi.py", line 525
>     msg += f"{part}\n{"-" * len(part)}\n\n"
>                        ^
> SyntaxError: f-string: expecting '}'
> 
> , which is introduced in the above hunk, I guess.
> 
> You can install Sphinx 8.1.3 on top of python3 3.10.12 using venv.
> I get the same exception there.
> 
> Your change works fine against Ubuntu 24.04, whose distro python3 is 3.12.3.
> 
> I have not tested against python3 3.11.x.
> 
> It would be better to keep compatible with >= python 3.10.x if at all
> possible.

Thanks for checking it!

I was aiming to make it compatible with 3.6. Yet, it seems that f-string
support is very limited on early versions. The enclosed diff will make
it backward-compatible with Python 3.6.

Thanks,
Mauro

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 543bed397c8c..e6e94f721fff 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -522,7 +522,7 @@ class AbiParser:
 
                 if cur_part and cur_part != part:
                     part = cur_part
-                    msg += f"{part}\n{"-" * len(part)}\n\n"
+                    msg += part + "\n"+ "-" * len(part) +"\n\n"
 
                 msg += f".. _{key}:\n\n"
 
@@ -546,7 +546,7 @@ class AbiParser:
                     msg += f"Defined on file :ref:`{base} <{ref[1]}>`\n\n"
 
             if wtype == "File":
-                msg += f"{names[0]}\n{"-" * len(names[0])}\n\n"
+                msg += names[0] +"\n" + "-" * len(names[0]) +"\n\n"
 
             desc = v.get("description")
             if not desc and wtype != "File":
@@ -570,7 +570,8 @@ class AbiParser:
 
             users = v.get("users")
             if users and users.strip(" \t\n"):
-                msg += f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n\n"
+                users = users.strip("\n").replace('\n', '\n\t')
+                msg += f"Users:\n\t{users}\n\n"
 
             ln = v.get("line_no", 1)
 
@@ -596,7 +597,9 @@ class AbiParser:
                 elif len(lines) == 1:
                     f.append(f"{fname}:{lines[0]}")
                 else:
-                    f.append(f"{fname} lines {", ".join(str(x) for x in lines)}")
+                    m = fname + "lines "
+                    m += ", ".join(str(x) for x in lines)
+                    f.append(m)
 
             self.log.warning("%s is defined %d times: %s", what, len(f), "; ".join(f))
 
@@ -644,10 +647,11 @@ class AbiParser:
                     if users:
                         print(f"Users:\t\t\t{users}")
 
-                    print(f"Defined on file{'s'[:len(files) ^ 1]}:\t{", ".join(files)}")
+                    print("Defined on file(s):\t" + ", ".join(files))
 
                     if desc:
-                        print(f"\n{desc.strip("\n")}\n")
+                        desc = desc.strip("\n")
+                        print(f"\n{desc}\n")
 
         if not found_keys:
             print(f"Regular expression /{expr}/ not found.")

