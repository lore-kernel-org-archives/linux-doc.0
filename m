Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F58829B777
	for <linux-doc@vger.kernel.org>; Sat, 31 Jan 2026 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769854953; cv=pass; b=Gb+eg0KEWUECB7iRRuWr5mizJhT4qvDnQsUVSanc6HwOlqRCp0/ovXcSNguk2xbCTvtL1fVpYYi2NobSvXQFRed1Pktf+Guf44yq7hFNwYiwVWmapDP0nz8KuiDMb5zCLIYs+8o7A526WU5NU6aUX5siLTmnEUu8IfaRYtzJxYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769854953; c=relaxed/simple;
	bh=YPQiVbTLDX2QySl8NWtf+H/tt2k8PPdv1MYIXxNFllE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bOyKnTFt5QNed8VXQw3yTkfivn+At/w8Cz2OCGxUV05JsZpF9u8ReOTLsBw9vodLqqkM+hUTHyC4VsmZ+NQG9j1bh/KubFfvZ1LPvKRrmEJnxEhEQ+gxuq9x+DyEzzxKZyQe0aLdA5mn4dA61JG0K9I/mprg2BkidboyiiRdz24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGfIBMRn; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGfIBMRn"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-658d3d3ac37so4802016a12.1
        for <linux-doc@vger.kernel.org>; Sat, 31 Jan 2026 02:22:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769854950; cv=none;
        d=google.com; s=arc-20240605;
        b=JqehPsv94cvWNGyjT0kRw9PnXDTenXJ/slrJkqBFEIX0y2dycQAkoVupPycZNWuOUY
         a9K4YRN9k9V4sRzeDa0RNiZxM48LyELfPcdgj1KcNOyWwQ0iThKP7ajmuqPDNbQVMMsE
         VAENhPno00tyzPsjgMfOUVls2UYg9CIVkqTBaMdqosjy6WDvy8va3v+q0bVG6Aur0oG4
         IKOaYGq8BXvNc/slZ/R08T8R72PAPfwhWF0w/UuZJyA3gjXDBYCcw0rpRBeRpkmLn+IK
         T6AilYL+a4qIOFFi77Vi9XM8/ksUsYcLdMsZOwEbWKeTsVZ/RRWm/OHA+J8jNd0GFgoW
         r/Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YPQiVbTLDX2QySl8NWtf+H/tt2k8PPdv1MYIXxNFllE=;
        fh=+h5x/O+D/N7XFCDBQY3oJzCAd3X/BAlk764Alz+SqZI=;
        b=OUg+ntR7y74LmZ7iuJ2jM5Uwm4tZfYkkB1yWS8+C0EKkH2aeaaY3d755vmJ3u11Aev
         frT1dXcEetVx+nAUcG1hAfrdcm4dHaA/SWllscJKXvlxth+rIJdyjs5KA+cdgissHPMy
         2BbwrYALlTL04gAVIbnuXIu/yMTSaoFiK33O0XfMFq7w3C/Lg5x/SQbcpamP6yDkit+8
         xqJgDbFAGwLV6bb361UkKYP9C6UqtQva4OJ+hOtESmlddknNFXwmaecjTChJFvN5sBtF
         Ef5ija5NDYq/Q4uHakFPA6SqQG3ejXpiJNb9GRpHCiPrSA+wCJa5Scwmu4teXyiwSCKG
         ih2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769854950; x=1770459750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPQiVbTLDX2QySl8NWtf+H/tt2k8PPdv1MYIXxNFllE=;
        b=iGfIBMRnH7Gv9C7JGDzZjOlHDgMv60hNIFmw0+QIXRVzM7SKUTps1f560iBkOWzFat
         H5w+wl7KDxwD0tG322MUxCsclAiTZP2uA8lIi3quR9Zi/En7F8/MMhFaG8HQWXSbpVJn
         wa6P2GwmCAtUmwH0W6D0u0Kj8Tert+BP1Plv55xmvT6b5/9hvyVRoSzSRjE+HqInNn7u
         Eg+9zFCNKM08fKBnV56xXR6rqqy0ijG5M/Z2FeIS358PE5AP3c3xE0JwwJMVCGYcBYel
         Jxs4oDIFzxfHplRXxSUAyJm7/II/SrX0xEum3A5D4NWoD+iXcyVU+Ex5OUEAAOrF5hZy
         dLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769854950; x=1770459750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YPQiVbTLDX2QySl8NWtf+H/tt2k8PPdv1MYIXxNFllE=;
        b=roh7nLk1C5NnDht+ORuVVQ3r1hjel28D6cdqSSx6/gO7HxowlVNHlrR+kD6Zy2IZg5
         tv+458qtbInqZi5BbHbJqvw0Xw0yNYYJibQDa/sargrB0TMjYbF7jC+Fl79OY25elV6K
         3DAAN/TPTkQ5n1EoziwdN5WfaRnUu/Vph60Zugn9qWyfi3d+rydcSJPnkKL6OkjMSJWs
         SOkaqZ+gb4doZ3lUXvaaaGbByhblu2ySCoHfAyzxrU1wYcgJ2Y0YonMf+7Fq0ywk8oFX
         pe7bIEIx8K3bToxSQjLX4E0DtrtyLMxbB4FtbOc5dQ8p8IVb8kp/8qGVXeKG5QsX4phT
         Q+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCU/0YIxxIOC2JzGMf7OAPxBVgM06NEnR6TTTukVJabWN5Oa0Lfg7Y3GdrO+gvgHfQD2+Ltyg5zmcKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPqqe2lD+tQpnQs++7erOqYLybcsu7b+p4NtGE6inqSi2YODMy
	Jr67IYe41BZQnzmV6h0z8Jwk60CrGqte9E1XhwlbrG0IrWTypabFM77O4KBJZTfiwWloil7Eui/
	WUati1AxZLTwAwoSVH4jO2hWFYERr7+g=
X-Gm-Gg: AZuq6aJNx+0af/KTMjwpUWqIB762oslsrrOqgaywMsTSpjj9Pbu4znTUxum1G1dcCbo
	F3NgkwJ6MF3zvwMcYESqs8cOLJIH6uMpo1DaestPVzhJRmrX9FYZx3JM2T5YD7toZ2YgZmFW3AM
	q1M4Xdqjjoo8rtgWR+lKZJ0OgGguRl84Cyvl7JiZ8ZR1VjzLhbqQgh1NgUSQDW5C2B4EENHzrS2
	bd2xsQOn5SHR+ABuTeftoeWaANpBDf4/cLm+V0CNv+OVOqTHnPvpZVSFTuIHvGvv/VA0neirOHG
	uCG0S3hIYwdQtcIUHQmL2TOSL314
X-Received: by 2002:a05:6402:3483:b0:64b:8d7a:71cf with SMTP id
 4fb4d7f45d1cf-658de5a0ce3mr3157686a12.26.1769854949593; Sat, 31 Jan 2026
 02:22:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130001418.18414-1-wufan@kernel.org> <CAOQ4uxhf6EQKcoN055xzmi-RW2GPxRzz_ExsQawGQBSmoX2WYg@mail.gmail.com>
 <CAKtyLkG1_evj7=yrB6nH-8fJuP3DsWyxwrhv7O_Mk=Fy8FOvVw@mail.gmail.com>
In-Reply-To: <CAKtyLkG1_evj7=yrB6nH-8fJuP3DsWyxwrhv7O_Mk=Fy8FOvVw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 31 Jan 2026 11:22:18 +0100
X-Gm-Features: AZwV_QhOhPDOYt2J1lFISrx3c1dHs0q3o3EvwGFAflm_-U4v5NyUzpUKw-giy8A
Message-ID: <CAOQ4uxjndETYhGayZH_opeMxH1zadW5G0DUHfdiGt=i+pM26ow@mail.gmail.com>
Subject: Re: [PATCH] ipe: document AT_EXECVE_CHECK TOCTOU issue on OverlayFS
To: Fan Wu <wufan@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, mic@digikod.net, 
	miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[+CC fsdevel]

On Fri, Jan 30, 2026 at 8:21=E2=80=AFPM Fan Wu <wufan@kernel.org> wrote:
>
> On Fri, Jan 30, 2026 at 3:06=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Fri, Jan 30, 2026 at 1:14=E2=80=AFAM <wufan@kernel.org> wrote:
> > >
> > > From: Fan Wu <wufan@kernel.org>
> > >
> > > Document a known TOCTOU (time-of-check to time-of-use) issue when usi=
ng
> > > AT_EXECVE_CHECK with read() on OverlayFS.
> >
> > Hi Fan Wu,
> >
> > TBH, I don't like the way that this problem is being framed.
> > IIUC, the problem is using IPE on a non-read-only fs.
> > Is that correct?
> >
> > That fact that IPE metadata is usually coupled with read-only fs
> > is interesting for the understanding of the use case, but unless
> > IPE feature mandates read-only fs, this is a generic problem.
> >
> > OverlayFS is just one private case, which happens to be common
> > in Android or containers? IDK, you did not mention this.
> >
> > Please describe the problem as a generic problem and give
> > overlayfs as an example, preferable with references to the
> > real world use cases.
> >
> > If I misunderstood, please explain why this problem is exclusive
> > to overlayfs.
> >
> > Thanks,
> > Amir.
> >
>
> Hi Amir,
>
> Thanks for the review. That's exactly why we CC'd you and the
> overlayfs folks, we wanted to get your perspective before documenting
> this.
>
> Let me give some background. IPE enforces execution policy based on
> file integrity properties, primarily dm-verity and fs-verity. These
> are the trust anchors, and files without these protections won't be
> trusted by IPE. Since dm-verity and fs-verity are inherently
> read-only, in typical deployments the TOCTOU issue doesn't exist. To
> support overlayfs, IPE uses d_real_inode() to look through the overlay
> and get the real inode from the lower layer.
>
> Recently a new feature AT_EXECVE_CHECK was introduced to allow script
> interpreters to request LSM checks on script files before execution.
> The idea is: interpreter opens the script, calls execveat() with
> AT_EXECVE_CHECK to verify the file passes security policy, then reads
> and executes the content.
>
> What we found is that on overlayfs with a dm-verity lower layer and
> writable upper layer, when a script file only exists in the lower
> layer, AT_EXECVE_CHECK passes because IPE sees it's dm-verity
> protected. But if another process writes to the same path after
> execveat() returns, copy-up happens and subsequent read() from the
> original fd returns content from the upper layer. We verified this
> through testing.

I don't understand how this is different from any AT_EXECVE_CHECK
TOCTOU race on a writable filesystem, regardless of IPE.
It seems to me that it is the user calling AT_EXECVE_CHECK who
is responsible for verifying after reading that file has not changed and if
it has changed, then the AT_EXECVE_CHECK could be invalidated
(depending on policy).

Maybe multi-grain ctime could provide a safe cache invalidating check?
As long as the filesystem is trusted to report true MG ctime.
See below regarding overlayfs...

>
> Overlayfs is popular in container environments, so we want to document
> this for IPE users.
>
> We noticed the overlayfs documentation
> (https://docs.kernel.org/filesystems/overlayfs.html#non-standard-behavior=
)
> states that if a lower layer file is opened and memory mapped,
> subsequent changes are not reflected in the memory mapping. We also
> verified this: mmap keeps the original lower layer content after
> copy-up. One reason we CC'd you is to ask: is relying on mmap to keep
> the original lower file reference a reasonable choice? Or would you
> recommend against depending on this behavior?

I recommend against depending on this behavior.
Please do not document this as a solution.

It sounds like you are documenting a recipe for how to write a safe
interpreter?

The advice to mount overlayfs read only seems impractical to 90%
of the container users which use overlayfs specifically to add writability
over a read only image.

If the generic ctime check is not considered reliable enough for checking
if a file was modified and copied up, what about checking the
STATX_ATTR_VERITY flag of the file?

ovl_getattr() reports the STATX_ flags from the "upper most" inode
and then merges some specific fields from lower layers.

I think that would mean that in the use case to describe, a copy up
would result in STATX_ATTR_VERITY going away when doing
fstat() after a copy up.

If this works, better document it as a good solution.

>
> The narrative in the patch can definitely be adjusted. Would something
> like this work better:
>
> "When using AT_EXECVE_CHECK on overlayfs, if the lower layer is
> integrity-protected but the upper layer is writable, a copy-up between
> the check and read() may cause the interpreter to read unverified
> content."

Sounds fine to me, as long as it is clear that overlayfs is just
a private case of the AT_EXECVE_CHECK TOCOU race.

Thanks,
Amir.
