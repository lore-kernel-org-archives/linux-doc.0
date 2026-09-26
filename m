Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAA33E410E
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790421182; cv=none; b=jw4HV/KK9wS9JdimBxmYBIenjFBFnCmCt0G+dr9xqoa2Cfg1iHYgUv0FevTvDjwShnt9r9fHYu8B0+Kjr1Pf6VPcgLQTwyPRgU4lWNbV6WzCHcok7Os3V2PUpevSv0P4CT/XHO1qLSUdgIBh6Bc8YYQEAy5yNIOdMdpZkPvZD3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790421182; c=relaxed/simple;
	bh=vXfnXeYRUumTCSRWXFgE0vtFWMPd57CL4FKjc0+BJOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WiULj/8tJEXwJaYJu9Nh7CIXSwyGMdL6QnpUZd0oaDlq8XQDfVAYIQxuOt8nRC84t0xJK/80svaFIYK8I2H4QjNk/ITdGZf317XZqfIeW8wn+XVI3fRGOQSfXgapD2El+XKC8T5xEor4TduLf75VNwxjSzpZ15PPDsIjIKH5EHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=IHNu4TCS; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="IHNu4TCS"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id E3AA8BD5B6
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 14:12:50 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 9FC36BD5B7
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 14:12:48 +0300 (EEST)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id E11321FFA96
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 14:12:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790421168;
	bh=xFkbRaOabfRBVw9vhprn3ZIPkocDhn20TDpdbxWpbJY=;
	h=Received:From:Subject:To;
	b=IHNu4TCSIUsGAtlg1dF5ERGr9MRliAdmyCMM0jIHa8xT1jJgyP6z878zR5cCKfmuu
	 tuNw7s9I7rQcmOAdSnG23qk4WvKluYlspK0uu3kCi8E+xqoPpcPEv4S9ZXsuQFKw14
	 R3YLRy17WXs8lruR3BMUOpDUbJ3UT8qMuHDJKkGh+tbNli+RAwWC3fRlreYEKZ84DJ
	 icxhqOMVfqvREfMnXUFVa8+i0ss+Dabg8AoPvCUdzeyEhM+fBNGky2gZ4MalpYOGAR
	 Py2XAbZS8bSPUIjNcLb0YfozW8tCAg+yifpOZ9NhWj5fcRBUdEmraUnh914eIKht2j
	 5hjVxQJmqh2Eg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.228.42) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pz2-f42.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pz2-f42.google.com with SMTP id
 d2e1a72fcca58-86e6d007703so796618b3a.0
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 04:12:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvByk1CJn7iH2heiQ9UVR+lhTqw0A6FfcoAgkixt2L+yNH2hETbn/c9FQV2lfMv89PJRpKeuSa1Iq/fg=@vger.kernel.org
X-Gm-Message-State: AFuF++kzjaJsROF62tgfj0M+aowJqwE25mWDsZ4F70iXb7krzZgrSNBP
	lZUUW0xkFRqwZNauBJdUp/XbzJIZrMw0MwjrU8ff3pKgPj6EI9knGmKS9h5bee0idXnNVPI0HVb
	25CGRJlhOjcfi03AYC1cSXT16iPeSC+U=
X-Received: by 2002:a05:6a00:6f0f:b0:880:4d6e:fd03 with SMTP id
 d2e1a72fcca58-8804d6f0202mr2927594b3a.5.1790421166210; Sat, 26 Sep 2026
 04:12:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924134945.3095661-1-sashal@kernel.org>
In-Reply-To: <20260924134945.3095661-1-sashal@kernel.org>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 26 Sep 2026 13:12:33 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>
X-Gm-Features: AclHuK-wG3Q7dAzGaz_XSxjYjAGh0dymYjJ1HQF7VhBQjKTkcShmejcHSsJBia8
Message-ID: 
 <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179042116813.2669561.1764317809691587353@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 24 Sept 2026 at 15:49, Sasha Levin <sashal@kernel.org> wrote:
>
> Most coding agents have standardized on AGENTS.md as the file they load
> automatically from the root of a repository. README already tells AI
> tools to read and follow Documentation/process/coding-assistants.rst,
> but that only helps if the agent decides to read README before acting,
> which in practice it often doesn't.
>
> Add a top-level AGENTS.md symlink to README, so agents load it on their
> own and follow its pointer to the AI guidelines. This keeps a single
> entry point for every reader, and avoids adding a separate copy of the
> policy that could drift from the RST.
>
> As an example, two different agents were asked to "create a new commit
> renaming the release (in the Makefile) to AI Test".
>
> Without AGENTS.md, the first agent added a Signed-off-by for the user on
> its own. It should never have done that: only the human submitter can
> certify the Developer Certificate of Origin, after reviewing the change.
> It also used its own attribution tag instead of Assisted-by:
>
> > Makefile: rename release to AI Test
> >
> > Co-Authored-By: <model name> <noreply@...>
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
>
> The second agent added no attribution at all:
>
> > Rename release to AI Test
>
> With AGENTS.md in place, neither agent added a Signed-off-by, and both
> used the Assisted-by tag. README itself mentions neither tag, so both
> agents followed its pointer to coding-assistants.rst:
>
> > Makefile: rename release to "AI Test"
> >
> > Change the release name from "Baby Opossum Posse" to "AI Test".
> >
> > Assisted-by: LLM
>
> > Makefile: rename release to AI Test
> >
> > Assisted-by: LLM
>
> Both agents also followed the kernel's general guidelines more closely.
> The second agent's subject gained the "subsystem: summary phrase" form
> that submitting-patches.rst asks for, instead of a bare "Rename release
> to AI Test", and the first agent added a body describing the change.

Hi Sasha,
I will second Theodore. I have been using LLM assistance working downstream.

This patch has two issues.

1) Agents already read the readme. The canonical way to force load the
readme at least for claude is @README, not just README. Even so, the
readme is not tuned for agents and results in context bloat. You say
that README is small, so it is ok. But it is not, it prompts the agent
to read a lot of other useless readmes. Another issue is that you say
that it is only read once, but that has not always been true and
perhaps is still not true. The Claude harness used to append the
agents.md file before every message. Unsure if it still does, I do not
use Claude. agent.md files should be specifically designed for agents
and handwritten. Moreover, they usually need to be tuned for the model
generation in general, if not the provider and model specifically.
Which brings us to 2.

2) You are suggesting starting to track agents.md on mainline. This
will make it so you dirty the tree of anyone that uses a custom
agents.md when they switch to mainline for a submission which is a
major annoyance. It'd be better to gitignore {agents,claude}.md on
mainline. This would allow anyone that wants to commit theirs
downstream to do so, while allowing them to copy their agents.md for
mainline submissions.

I personally no longer use an agents.md file for the kernel. I briefly
experimented with it in april. But the models are getting much better.
For example, in April they could not do rebases correctly. Now, they
mostly can... Yes, it is true that my agent does not follow the
Copyright / Assisted-by: / sign off as they should. But this is a
small issue and can be rectified with a 5 line agents.md file that
tells the agent exactly what it needs to commit for _me_. For various
subsystems, it can also include common mishaps in that subsystem for
the specific llm. For example, I found that Codex Sol does not use
mutex guards. I could add that to my agents.md. But people that do not
use mutexes need not do that. And when my model updates to one that
does that, I can shed it while not affecting anyone that has a
different model.

A better suggestion would be an agents.md template that is stored in
the kernel tree with instructions on how to make one. Perhaps some
templates about custom workflows for agents as well so people can mix
and match.

To that end, I attach a sample agents.md config below after a trailer
and cc Kees who acked. I just wrote it now based on my experience with
Sol 6, so it is untested, but it should give you an idea of how an
agents.md file should look. Compare that to README in terms of tokens
and usable information.

On the broad aspect of LLM use in the kernel and open source, I still
do not know how to feel about it. I have reservations about posting my
_slopped_ drivers on the kernel and I know that especially for HID/WMI
trees it is starting to become problematic at least to me, as people
without kernel experience start to post 80% good nuff drivers that
work in their usecase but are not mainline ready and working through
them to do that is not practical. I could just reference the registers
they use on their driver and have a mainline-ready submission in 10
minutes while discarding their attempt.

Creating a mainline ready driver used to take 10+ revisions, at least
it did for me, and involved a lot of investment by the subsystem
maintainers over months. They did that for me and I am very
appreciative. But when someone random appears one day with a couple
thousand lines of code, what are you supposed to do? I am not sure,
but I am also not a subsystem maintainer so it is not for me to solve.

Those are my 2 cents.

Feel free to cc on later revisions.

Best,
Antheas

> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  AGENTS.md | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 AGENTS.md
>
> diff --git a/AGENTS.md b/AGENTS.md
> new file mode 120000
> index 0000000000000..100b93820ade4
> --- /dev/null
> +++ b/AGENTS.md
> @@ -0,0 +1 @@
> +README
> \ No newline at end of file
> --
> 2.53.0
>

---
We are working on a downstream integration kernel to enable support
for new devices.

When committing a driver, please use the following tags information
for the commit body:

Assisted-by: LLM
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Use similar information for MAINTAINERS entries / copyright notices in
drivers, which you should append when making a new driver.

Our current test device is a Galaxy Book4 edge. You may access it
through `ssh edge` to run commands. To sync a new kernel to it, use
`./sync-arm.sh edge > /dev/null`. The device will reboot with the new
kernel.

If a mutex/spinlock is needed for a driver, please use the new guard
syntax instead of separate lock/unlock. You may create new
scripts/readmes for temporary integration. If doing so, please do not
commit them alongside the driver as they should be discarded.

