Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4AA31E84F
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 13:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814670; cv=none; b=jUY7tx4EtZh5WEpzHLf0LPz5tuEkgHRF5/akCJBqOORs4eL4EIaxtg4An7A+oAwnn/zJriVihe7izRq22nteloTz9Jkb8gTBuF6Hg51w4jZBajzwqt5f35qv8gV+WqmzkaJnXPGtYbrp3eowPVXYJBXcayP1HRgtRcVpqnyayhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814670; c=relaxed/simple;
	bh=qTCtUO20aHBaoQd/HG/5QDxAb9VXAQXH9n/VX8aHHlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/gBcyIHwerDlDpmPMDntEiN5X/avSI4v/A0ykuAGZUD49p5HWGHj7mRyp2EYl6dII10u70ZfASdxwo9SLxLPsuXePCAUFoe+952ldyAKW+deUqq/+aSF57HFIddDA/WLC78JrDOdUXOXvlk5K6kNHXbfE5/ZyfjUAVCIZjPRyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOfp7hrN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOfp7hrN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB471F000E9
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784814669;
	bh=n1DEl7HdaV9+H803Y0sSiDSe+MyaXZhWnsHtsDRoo7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iOfp7hrNc0oZaZ+alSQcXJ3Cboe2rtQqqsfoHWnMhLVl8DF3aTron8KuYgPkzJfVW
	 7fTIZrknbl97BF5lnK89UOYIdS9oX5LcAUUovy+/BOGQvj1FL0yHT3qhhGLZfvBqn6
	 aoh5FcygjQdl7G+fc+GmWqJo/wlrc12kJtq1En+wd6LH0a+DF8Nf50TF7X7tduIrO2
	 7qyxQCfnJ6NQ+ITyuifI4rO3ilxdXU4xI2pcnMX4oBZeOMLJyRqBVAfJYeMKbpIHe7
	 Hzux4o2xgP04VlydQcBPibNP5Ux04uu99Oul+IisepEgrxO4oQKg0IAN+Tqu4kedNx
	 /MAdllnHX+B1w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so576479e87.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 06:51:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoiMz+28eJXuYXFtlyVTlK94Latcflk/zmSHbC/e0R1jrVaW6ODO+nFvJ5CR+rtpccT7znUsA3hNEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1FeMF/m3dFhjaTAztCE7b4RDML6jbxoIjeeNrEhRZHuLsrEp
	ShpCpJuwwOgI137kssgEZ4CKlfcve61cGCmDzkQ0G1AeD/d3syioFsLb4HSXam/rmM+WccHbFSQ
	5gTAJBtGhGt0gjJPf17KgkuQPO2GPaxFZS1eaD3CT
X-Received: by 2002:a05:6512:250d:b0:5b2:af9c:a5cf with SMTP id
 2adb3069b0e04-5b2b33a6299mr612275e87.27.1784814646486; Thu, 23 Jul 2026
 06:50:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-work-failfs-v1-0-3f69b9a9e958@kernel.org>
 <20260723-work-failfs-v1-4-3f69b9a9e958@kernel.org> <CALCETrVDX-PcSJoHFwymh7d=oUKotJQQuh+AzmsA7YQySBzD3w@mail.gmail.com>
 <20260723-mahlt-abhob-semantik-21254c8d36cb@brauner>
In-Reply-To: <20260723-mahlt-abhob-semantik-21254c8d36cb@brauner>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 23 Jul 2026 06:50:35 -0700
X-Gmail-Original-Message-ID: <CALCETrVezim-eYOFWon1w7FngTgWb2nkuZb_duf9q=TrNqiqkQ@mail.gmail.com>
X-Gm-Features: AUfX_mxrk4wRgWPLjixGoyqZWEAlTjavFRX3T9mw_3W96-ZNwXFV2jgzWe5MeHs
Message-ID: <CALCETrVezim-eYOFWon1w7FngTgWb2nkuZb_duf9q=TrNqiqkQ@mail.gmail.com>
Subject: Re: [PATCH RFC 4/7] fs: support FD_FAILFS_ROOT in fchroot()
To: Christian Brauner <brauner@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, John Ericson <mail@johnericson.me>, linux-api@vger.kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Farid Zakaria <farid.m.zakaria@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 6:09=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Thu, Jul 23, 2026 at 05:49:06AM -0700, Andy Lutomirski wrote:
> > On Thu, Jul 23, 2026 at 4:37=E2=80=AFAM Christian Brauner <brauner@kern=
el.org> wrote:
> > >
> > > Once entered, failfs is a throw-away-the-key moment. The task is
> > > considered chrooted so it cannot create user namespaces to regain
> > > CAP_SYS_CHROOT. chroot()/fchroot() back out require CAP_SYS_CHROOT.
> >
> > I kind of alluded to this earlier, but I don't think we should promise
> > this.  In particular, I still think we should eventually allow a
> > non-chrooted process with no_new_privs to chroot to any valid
> > directory, and I think we should consider changing the definition of
> > current_chrooted() such that failfs-as-root would cause it to return
> > false.  I'm also not sure why it's useful -- if I want to throw away
>
> I had considered that but introducing this change alongside this series
> felt too spicy for me.

I think I agree.  My only actual objection to your series as is is
that your wording seems to make a promise that I think shouldn't be
made.

>
> > the key to accessing the normal contents of my mountns without
> > changing my mountns, I need to chroot somewhere (like failfs) *and* I
> > need to somehow prevent myself from getting an fd or a magic link back
> > to the ordinary mountns contents.  If I somehow get such an fd,
> > preventing my from fchrooting to it doesn't seem to accomplish
> > anything, since I could traverse the fd with openat, etc just as
> > easily, or even fchdir to it and use relative paths.
>
> I think I generally agree with you. My main concern here is mostly about
> changing very long-standing behavior here and making failfs special here
> feels like it could easily misused.

I don't think either of us are really suggesting making failfs
special.  I agree about the long-standing behavior.

>
> >
> > My understanding of the exact workings of the mount tree is possibly
> > not good enough to specify the semantics I think are correct quite
> > exactly, but I think a decent approximation is that a task should be
> > considered to be not chrooted if its root is at the top of its mount
> > tree or is not in a mount tree at all.
>
> If we could altering this definition from the patchset I would be in
> favor of it. I'm curious what your take is though.
>

I can't quite parse your question.

I have three sort-of-concrete proposals:

(a) current_chrooted returns false if follow_dotdot starting at
current root but with nd->root equal to the namespace root would
succeed and return the current root.  I think this is fairly solid.
The main caveat I can think of is that someone could create a detached
mount tree, chroot to its root, then fork and have the child:

 - drop privileges
 - set no_new_privs
 - chroot somewhere else

then the parent or another privileged task mounts that tree somewhere,
and the child could now access the parent of the mountpoint.  Any
actual exploit based on this seems farfetched.

(b) separate the concepts of fs-root-for-absolute-paths and
fs-root-for-blocking-dotdot.  IMO this actually makes sense but would
would be a much more intrusive change.  We would have
fs->root_of_abspaths and fs->dotdot_blocking_root, and fchroot would
only change root_of_abspaths unless a flag is set asking to change
both.  (And document that setting that flag is not advised and that
one should create a detached mount tree instead for 90% of use cases.)
 And no_new_privs tasks would be allowed to freely change
root_of_abspaths.

I like (b) conceptually in the sense that I wish no one had ever
invented chroot-for-security in the first place.  I'm not sure I like
it as an actual practical idea because it has a much larger scope.
Also (a) is almost equivalent as long as no one ever sets the root to
something that isn't the root of a mount tree, and it really would
confuse some people if "/.." was not equivalent to "./".

(c) Add a bit to fs_struct called something like chroot_locked.
chroot() sets the bit if it chroots anywhere other than "/" or its
equivalent.  fchroot does not set it unless a flag asking for it is
set.  Switching mount namespace clears the bit.  If you have
no_new_privs and don't have chroot_locked then you can chroot.


--Andy
