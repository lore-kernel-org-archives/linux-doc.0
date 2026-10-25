Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940256;
	b=lEn8r3ksuv5qjZZzJyquEpb0hFb3VuVz/wTh0SnOFTTTX1H2vRl7yyRpMKa0NvMxCtbB
	 7gsJ+xogVKQ+ArQ9MmSVlrq0RoYnDUkYfQZarQTwPgZUrh9E27uMMrzGwicTCcK2MuWAy
	 qdeczdyWdFAlM/T8hOIxNETfbucjChK3Dd+/rrGYT7nmf4wBHAiKYesVhL4Bsr602+oEU
	 cIV1U35dcuARbsZShB1bwUvQLZGsOMD+wucfd4hIQovG46EdrGrkp4UlI2sH9SKJ6lWVH
	 t7v5y8jFtciGEqt6kTjhnA7ZRipIER0D40ithcL1NM4DSytSFUEPs/zgL8NKAcO72Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=IExH7VqrZ8oPD6Z8eyPZrnBoWcrKLM561SgLi8Akt3Q=;
	b=nyqxcPipph82MSiOHiiUvTGSHMcR4IfT1EB2vea1AR9DBCkEjHfbNAbAa+KE70gip0xx
	 mP7EGtT1tOr8/Y1ICphvXHS/bJiTYG/CGt0/kWe83d36OuDvyyq8Xcz0t0Q5Q2d3nqYdN
	 Xfo5+XhXKG08waaOqJ5NeQmI4BImOsCxC1WE5I509MGcZdSpF1R5lz/qyWt07Jb4t7qt/
	 Lt+U3D2WxN7yyPyD0BDeJgw14AVx6lFqO4DnO+t6X63Pc3FJP+vWktEhOYQBCB7Gw95rv
	 aoBopji2baQeeauoCMBEHXbqHYVqCrQ+e5D8RzbMFxAIlvDQFWvzfaPvAik/L1lz30Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P7Ipz8vv;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4E1606A31A
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 14:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P7Ipz8vv
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so6152145e9.1
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 07:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940254; x=1793545054; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IExH7VqrZ8oPD6Z8eyPZrnBoWcrKLM561SgLi8Akt3Q=;
        b=P7Ipz8vvUWjpF6FHXG21uKZKLgsCCgQG3zNgpPHYI7kNj/SzMLzfA1i8Yh+l5L67RN
         +lnFJijTHERB8MBgM7MQvq+ia5BTwqQ+O8Bo3eAuXvyGDVJndQfLIC5iz8rLKEU0vvmd
         ZusY0rRuHxrxpmAikb5wG1YGTMRRjtt66YeGaMSLIb17IdJV98dYTI8m+xZFFfU2kHB1
         pv+EGQv+SQuyEERCUbNj6Hcq/N1N4qao5PUPxTYz6Lbcl1ls5SFzU+14Jj0yzoI3cfWi
         OiMy4HjCXERNI8dveVidEVDlFuHqzs1iTNtr0VOIfnLhVFWziFqavrN9q3ne+IysQUZD
         GtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940254; x=1793545054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IExH7VqrZ8oPD6Z8eyPZrnBoWcrKLM561SgLi8Akt3Q=;
        b=sM514eNF1iZk74nOyMzL2Cy1JSWCMfsoO/xkwBC9Wdzc8VuQt11HARN3ZhX74MT3dQ
         FhIqaaYCCcLqKtGgt7bEst8nLJ3KOl7Vc2wNtH7RLL/so7/oe3xR+BkbrsEesSkH4BJw
         l7KKpNJ9pg53+lPQ8qPPwdBMko8kcIOIlGJc0/Ngi/r+uIqrh4mZbZ5+brlcfuBukyZ+
         TxpyystBNimpBeyyDB5Lg4VL1BqQhxB1OtaIBVwzR5hu5rVIFTFq3WbTFPDM2KhWdDZD
         1jXGKFg1BEVj76UiaAmjn0+yPHQoOBtm2UtmleJW4SBk11rJUJXc7KaXw7xPLVBtQFxi
         TqaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZRB90t+/wjNKczDjSlrOz/b+2dVpMJgPX33K77n/mpUJMqtIp/arDfK4/Cg+yyGFogGvka0OrR7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeuEAW18NmGjkzkFrRmny1KvU8jkn3oksykE4Ns819ZQV8RTxI
	3A1Mod3yCl5I0P7vofroeT4oUsWUogN7lOwfDPmQPTjFI7xA4Mhn+She/+QENQ8E
X-Gm-Gg: AYBFou2NVM2weeOEctPswhxzSf99hLyjPQi+bfBn7k/Y43vKN8A1eqTyUT1W4C6Tozc
	ZEmGOqVj2WrK5OpOGqTIw0q3ZlNPEoJilXqFBt2YTjBy3oA5ar0mZcTjsYnBJpbXMIfApMv4cy9
	ZedCYaZ9QIZS5CcCFJRcgtBJ8kaAz1TxEgfZQ8s3b0uYyAtSEY3jm4+8qJBSjFGVMjAq3JB16eO
	8/mDu2Tgd9bejfQEKpdcE6P+X6fN3/ZITo9mOqHHT7Dd55foaisFfD9ul8/zUt36JqddC2GmJ+8
	ADQubI6E1YEd/VevIpxJDUJgSd8aer8A8yLlC7yO8D/9X9ZaH52Sdivp0JCBZFbCHUWQg0v8+Zy
	coKDSBpxd6MHtV8Tg2ffcpY2JzDnMrRQrcQf1mnCps1nAApdI9T8iF5t7eUAS0mHc5OeD+JRS0H
	lYDR6hjjk5b4uURXX3MD3Y+9jOfmMjIV2F3+evY6EcuBEN7fC0r/opjM+hR07d9CXNnIbJDMPyb
	b+MYSSpDsKgVDwnjRkWSMh6OSHxaQYzCWBEmOrFO+fSwlncOC/nO4crDJwTAXzhvTBpMMK1KK0V
	XnYc
X-Received: by 2002:a05:600c:6095:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a35ac7f0d2mr64643565e9.9.1792940254154;
        Sun, 25 Oct 2026 07:57:34 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm11218693f8f.38.2026.10.25.07.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:57:33 -0700 (PDT)
Date: Sun, 25 Oct 2026 15:57:32 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Farid Zakaria <farid.m.zakaria@gmail.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ericson <mail@johnericson.me>,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] landlock: Add access rights on created files
Message-ID: <20261025.8e22954c9c47@gnoack.org>
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
 <20261025.769b43a39e24@gnoack.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261025.769b43a39e24@gnoack.org>

On Sun, Oct 25, 2026 at 12:07:10PM +0100, Günther Noack wrote:
> Hello Farid!
> 
> On Sat, Oct 24, 2026 at 01:39:16PM -0700, Farid Zakaria wrote:
> > This is a proposal for an idea to add support for landlock to work
> > better with build systems such as Nix where they want to apply
> > restrictions but the paths may not yet exist.
> > 
> > TL;DR;
> > ========
> > 
> > Landlock rules attach to inodes that exist when a ruleset is built.
> > That makes a directory shared between trusted and sandboxed tasks hard
> > to confine: the sandbox may create entries there with
> > LANDLOCK_ACCESS_FS_MAKE_*, but no rule can name those entries ahead of
> > time, and granting read access on the directory to cover them exposes
> > every other entry as well. This series adds a rule flag that grants
> > access rights on the entries a domain creates in a directory, instead
> > of on the directory.
> > 
> > Motivation
> > ==========
> > 
> > The motivating user is the Nix build sandbox. Every Nix build runs in
> > its own sandbox, and a build may only read its declared inputs in
> > /nix/store and must be able to write and read back the outputs it
> > creates there. Nix enforces this with a private mount namespace: it
> > creates an empty store directory and bind-mounts each input path into
> > it, one mount per input. Nix has paid this per-input cost since the
> > sandbox was introduced [1].
> > 
> > The cost is paid per build and grows with the size of the input
> > closure. Nix is moving towards much finer-grained builds (many small
> > derivations instead of a few large ones), so the number of sandboxes
> > grows while each build's own work shrinks, and the sandbox setup is
> > becoming the bottleneck. A typical build has hundreds of inputs; large
> > ones have thousands.
> > 
> > A microbenchmark sets up and tears down a Nix-like sandbox (user,
> > mount, PID, IPC, UTS and network namespaces, pivot_root into a chroot,
> > removing the chroot afterwards). It compares one bind mount per input
> > with a single bind mount of the whole store plus one Landlock rule per
> > input. Median latency per sandbox, one sandbox at a time, Linux 7.1,
> > ext4, 16 cores:
> > 
> >   inputs   bind mount per input   one bind mount + Landlock   speedup
> >       10         3.2 ms                    2.3 ms               1.4x
> >      100        11.6 ms                    2.8 ms               4.1x
> >     1000        79.3 ms                    6.4 ms              12.4x
> >     5000       400.1 ms                   24.4 ms              16.4x
> > 
> > With Landlock, an input costs an O_PATH open and a landlock_add_rule()
> > call: there is a single mount, and no mountpoint directory to create
> > before the build and remove after it (removing the 1000 empty
> > mountpoints alone took 17 ms).
> > 
> > The single bind mount is only sound if the store listing and the
> > undeclared store paths stay unreadable while the build can still use
> > its outputs. Without this series, covering the outputs requires a rule
> > on /nix/store itself, which makes every store path readable again.
> > 
> > [1] https://github.com/NixOS/nix/issues/179
> 
> I have not done a thorough code review yet, and will focus on the
> general approach.
> 
> I am generally in favor of this approach where we keep track of the
> directory inode plus the file name.

Apologies, I think I was jumping to conclusions here when I read this
too superficially - I realize that you have implemented something
different;

If I understand correctly, your proposed patch set is granting the
access rights on every file that you are creating freshly, but not on
files that were created by other processes in the same directory.  The
semantics, from what I can see, seem like a Landlock variant to what
the "sticky bit" does in /tmp -- you have access to what you create
yourself, but not to the files created by other processes.


## Alternative suggestion

I have been discussing the other approach with Mickaël a while back.
This would also work in use cases where we want to express a rule on a
path whose underlying file inode might change, with examples being
/etc/resolv.conf (recreated by a DHCP client) or Pathname Unix Domain
Sockets (commonly recreated when services restart).

In that approach, we'd add a rule like

/* pseudocode; name and exact layout TBD */
struct landlock_path_beneath2_attr {
	__u64 allowed_access;
        __s32 parent_fd;
        char  *basename;
}

During the path walk when checking for an access right, it would match
if the parent_fd matches an inode and the name of the next path
component is basename.  For example, to access a (potentially
changing) /etc/resolv.conf:

struct landlock_path_beneath_attr2 attr = {
	.allowed_access = READ_ONLY_ACCESSES,
        .parent_fd      = open("/etc", O_PATH|O_CLOEXEC),
        .basename       = "resolv.conf",
}

Or to allow the creation of an output file:

struct landlock_path_beneath_attr2 attr = {
	.allowed_access = READ_WRITE_ACCESSES | LANDLOCK_ACCESS_FS_MAKE_REG,
        .parent_fd      = open("/output/directory", O_PATH|O_CLOEXEC),
        .basename       = "mymodule.o",
}

Would that be a model that would work for your Nix use case as well?
I'm imagining that you are declaring the exact list of output files,
is that correct?

–Günther
