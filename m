Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FB436B92C
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 06:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748097; cv=pass; b=JDNOzE4X0M1GnUm3siX+w8Gl/Phw1bhUKKUBxLdZlHhP6NKqyCBHGuDpWpi8224ZOxcffDUL8OUeDSDgloQtvS+T3avGBt7JibhAnIlit7bxYwEkp+Q3Cqia1t370vBByuugsfV3vPiZrIaQmJaFfcS/Eu4dgtbyXsF8LIEchV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748097; c=relaxed/simple;
	bh=IcOj33yDRHvyt5L9JitZ1ZGchB+/DNq2PYiHYhA9vDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDuzCG5BTBDKRPkBfx+jyL2+0zE3t7TI/7SqHWx+S12NmSmXXnXGhv3bpPE1YJCQ2VWlhLEjOwBL5Q9Vc5g+xcGe8voEEv8g2h9/TFf7BwDdxtNEh020etIVIOVuIopmv0HoGZHrxB13o9enYp8phP7R5mAciIX33TIqf6CyfTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2w2WyCC; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2w2WyCC"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ad795d5205so408063a12.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 23:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790748094; cv=none;
        d=google.com; s=arc-20260327;
        b=Ecald/IHCNnhaeQG7xLevtk7X1q65e+UnokYbObrXN5f7wfOQaErEtLA9mgQIwgaNM
         mokh13kvVEwmd/ZOflsNzzGad0gUWJgnf7e3QyHsfhPOf/PWldv1Uq1IkEc3OpqlS19v
         5XabDFKGkI/i5A9ajqI9XYX8VwnLpEjg9RErjluPm0qT5DUyT6uMhOp/PMnVfJS5h0XK
         E8tMcS1MA6TaSKav7Huv1XsP8+QckPbc/hYsm+T4qpPUWZAp+O63gOMJedJCIx+OAQBQ
         5A1hpAq816TlYTkDwrMWe0MTACSZQ8R5aPZ3f8UWTYQ95P/xTo/HwLyGBv4h6UFcxOuQ
         ltQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IcOj33yDRHvyt5L9JitZ1ZGchB+/DNq2PYiHYhA9vDY=;
        fh=vci4ozrSpqCHYIDQKm7NySyyzHyY/mgW8zOkTY4JC0U=;
        b=XC8uyf9q5MYrzEkMk8/CnK66otUNjKFgToynPMSby8dpmG65cC1sqzoanwyRWHLOjG
         opt+4aCD2nYb4bg7WMazLCZndOXA4Fy6ejIANVg/h37erga4MI8dqKh08zSJuoGAAZzF
         RUvIJZsuoWxJsL9SAHti2fRc9nfKV7h/+i0Z3uOwU4LuVT2inPJK7lefErF4rlTTxnjN
         QA03eYb5HwW/a81afLIhYQmHPNhJ+YatDtEY0V3CCkvy6nNDyNrHZqAKA4DS3bDmUKpS
         iR3S4xjPe0bTp0cO9DgqxqBVhTu0te7by+ahhTPJw2/rwNfZCrB+eQBzygNYeESXkf4w
         Z1Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790748094; x=1791352894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IcOj33yDRHvyt5L9JitZ1ZGchB+/DNq2PYiHYhA9vDY=;
        b=J2w2WyCCeWOVNjJoRf4knmvAJZwYoof9Tfmjv75e1CljA59RiJx1hu1lbG8BTwgoFl
         hbcCg8q/PnyvW9cwwjmNsAIp92ppA1DI0nE3enbDCjkSEoHYK8SlVyuRzKJitMHOMTze
         i7vE5erQ4su9J6kqKzG2iOWaa6LU6qxZZ1obGentJq7Yo1P6F7gRfaq8WHccVW2Cf/3C
         fzulCkBt5Hh5wNrprRceeU3SV7dPN+vIVVvq9MJNrNQ0kk/4Mc1RzbLi4Jw62z7necy8
         2M8A/mNgPnPkcyYcnE5an43tYcX101irky1Av5MkM+1yWW6mVPQQ0rr5wIXbQgd+XRZi
         2AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790748094; x=1791352894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IcOj33yDRHvyt5L9JitZ1ZGchB+/DNq2PYiHYhA9vDY=;
        b=YnzN0/zOhzO1Bi/3mAEbWMj+2xAb0MD/UXsMcwn8krmRtuKJ6Ete8hlO+Ayj3FfHJu
         vmKjg2UENDPF1g+xnwcuJe5y75F8X/uVDMvbDl/7KzDgzAuhgQ1VrzexpEYipsshsIIi
         PYTuXqngOFUctW3sraDvvcdu5bn1mOjSBdhZI1pabsw7yIpYgjMDvTqvbh+xrHzRPz28
         fZN5rlV/PTCGFBcqEiZLq8CZUKMlaRJw1w1n70oiOI8sI9gv3BR4puLlWMNZhPTuH8bK
         wOkyG41EDbekk0irSy0SEXoPrC3fw/yH3Kg6MsWMj72ZUPUtAIHacvmkOBwueL/vbnoF
         R3/A==
X-Forwarded-Encrypted: i=1; AKwUvBxSppsgxEXsLKnTv3NlDwT0RbKJ7aOQhcW4CpJ757wZRpYg/F1avkDHInG4Hyi6sTX35IObp5dTbDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt9JGoXN2ZDRZtZ9LTh/N2bodR7RCqMh88Cf3OiCX5TiovGX44
	HGjMPg0kFZQqDiLcrNki6yv6R9sSDKKFqUIu/1UPZwqLBzCFgjPq1oGZOK1duPPgAASrCjitebj
	7u0NtX2Dr8ISrKW5wzORXFBkZ/VtmJpY=
X-Gm-Gg: AYBFou02VbpyOwwLp+kz+TJ+VJB1ngE1zGQhFFrCtZbkWzE6QUWVv2fK9f+dL9uVofM
	sJWI9kKGvboVFYX43wdySO9KI0v0tJlu5VFXPQoLS622ql69LeSff1QSWwdutFxCmu9VRtM1C+X
	V/kOZuvQr0HEPypeqIZ4mDwaceWo0qAhGqw50HPnuTwUWVxJmNKnjKsujP2k7dlW4hZ4KIBOdda
	LV1clACj6/i3OqDXG7mV1HKz4t3RbIRx2qWqJmI95XOGbrVokg6hrsxOPMtT92J9o/eK7DNFFCA
	ps+qlJCiv3odMCAtbE2ujq/oDKrMEilF4ID/GttZOev+f5eJ/Z5T2da/Z3X7t9OSzEw=
X-Received: by 2002:a05:6402:240d:b0:6aa:b341:3f9a with SMTP id
 4fb4d7f45d1cf-6ae199552c3mr84751a12.39.1790748093339; Tue, 29 Sep 2026
 23:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927141437.1432584-1-russ@har.mn> <20260928014357.2285448-1-russ@har.mn>
 <CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com>
 <CA+zrezRqjY3_V1cDRpTVsXY-d_2CEVkhPqjWiztuKH1CG63jUQ@mail.gmail.com>
 <CAOQ4uxj4xQ9Z=9JH=U21iHnfLBQLboz5dsivigKicWS22M+zgQ@mail.gmail.com> <CA+zrezR3vZOH4-DJbu7kRu=qXF4RSWUxz3BjpnOou_vy6eDcwQ@mail.gmail.com>
In-Reply-To: <CA+zrezR3vZOH4-DJbu7kRu=qXF4RSWUxz3BjpnOou_vy6eDcwQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 30 Sep 2026 08:01:21 +0200
X-Gm-Features: AclHuK-4L2-xB50QQpUyCJRdrgV6J6jaFhZT4eTld-X9LxMW38Hfe-Cy2gWP4SU
Message-ID: <CAOQ4uxiw-=keqrbFsPSAz6USCbHe1EtpjnGCLsRe2zXsXMeEog@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add inode generation number support
To: Russell Harmon <russ@har.mn>
Cc: miklos@szeredi.hu, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bernd Schubert <bernd@bsbernd.com>, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 10:55=E2=80=AFPM Russell Harmon <russ@har.mn> wrote=
:
>
> On Mon, Sep 28, 2026 at 9:54=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Mon, Sep 28, 2026 at 6:04=E2=80=AFPM Russell Harmon <russ@har.mn> wr=
ote:
> > >
...

> > >
> > > If I remember correctly, name_to_handle_at on a FUSE filesystem
> > > contains just the inode+generation, and open_by_handle_at results in =
a
> > > LOOKUP of that inode (and now inode+generation). But I'll
> > > double-check. Assuming my memory is correct, I think that's
> > > sufficient, assuming that we consider inode+generation as a unique
> > > file object identifier.
> >
> > The problem is, that what you assume is not an API definition, this is
> > a specific
> > filesystem implementation, which happens to be correct for some commonl=
y
> > used filesystems (e.g. ext4, xfs), but is not true in general.
> > In general the API {name_to,open_by}_handle_at() the file handle is an
> > opaque blob.
>
> Maybe I'm thinking about this backwards, but we're not talking about
> "any" filesystem here. We're talking about the FUSE filesystem where
> the definition of a handle _is_ inode+generation. All I'm proposing we
> do is to expose that fact to the FUSE userspace daemon.

Correction.
The generation is exposed to userspace daemon and to the kernel
via the LOOKUP response.
All your patch does is re-validate generation in GETATTR/SETATTR.
Practically this means that generation is validated on attr expiration
time. This is a reinforcement of an incomplete id model, but it is a bandai=
d
not a cure.
I fail to see the real world value in this change, so please do explain it =
to me
in terms of use cases that would be improved and by how much.

> That daemon
> can then turn around and call open on another filesystem, or make a
> network call to AWS or whatever. In my case I want to
> open_by_handle_at on an underlying filesystem, but I can solve that by
> storing a mapping from fuse_ino+fuse_generation_num to
> underlying_fs_file_handle in my database.
>

Exactly! The daemon does not need any changes to FUSE protocol
to have a perfectly correct implementation.

If you can demonstrate or envision a filesystem that would benefit
from your patch please describe it in your proposal.

Thanks,
Amir.
