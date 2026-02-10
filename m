Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0B820C463
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717230; cv=pass; b=RuxxjpSuWewCCQhXLNHacVqCWExUq1LB/BtwjGzrTQ/kM/OLPqbqxk2wXIglTdCwD0miSINzjzTZlfQfvMgVOCMA2sVQDqyTpkICsEZ9Pj7kYhAHBdBTD6t3sChOI0aTH/Wf2awhyyHv1gLqzToipe3mHXJP10HFc7N2Xv3jaj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717230; c=relaxed/simple;
	bh=N8Ghhb22gM6G+BBjUIo+VQvUWs/IXQhBKkMnRrxr9u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7LdwJvyTJ1KP2GVoDNupR2heV2YXdjGwLiq7ZuoY+DqItXWGs1dDxbsxISYMRNeh1WvsIQNNUDPPVQVQnwbQiq6qH/W5OHk2GkrlGaUdUMIbkEzkAsyJ089C5BKLoIMtwHJazrxrJKQoBvIkIxk/tqsgbfdz71xSKHuLqX9wJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEnUGnby; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEnUGnby"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ba716126f5so121073eec.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 01:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770717229; cv=none;
        d=google.com; s=arc-20240605;
        b=c4NZQPbtAxw2Add2H8dO5PHsOcmUeXxfaODOnZgXJOVtIjBNlm0F+k271j1Jz/7SMA
         2ntt4yL3PnYX7SJoX8z3JVM9KQmOYFGwMEuyBOjgB6UxUQN18mXXy/c50BIlsPEBZu8g
         LDjua2LfvXYg8kFHBhMQ55WVTf5KY/GIRy4KbGnH+kaTuMurFVsvvJLbhBSR5ZFJ9evn
         B9e/DYna2CG6G0s4G5hhcUiFQd3I18TX5+/wwKRXGMRGnFocARrmQJJxWj2Ugb2AoyYS
         5qE3JDKUcMsxucPgiiaE346faruRfhiNHjiNb/NmdEBTNCzWAa1b6xf0QFx+n21fJq+a
         lqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TEYSNWOQV6E13o+30W3QX8BMHVywb2NGF4ndnphpGA4=;
        fh=F49cyB5By/5fQ9I7H1mXB3TykLkg9khIuwidahi/EZ4=;
        b=Wr55SRutdByNCFz4MAX1RvHaCBwmEvoD+d+NnhJXvUcussZM97cdlRGx6oVBfU2G7Q
         MHs6l7FCHlnHtbjrYeL8BC3WxW7+nAI4N6jaWMTPhtsfJ3rL/YyxfFQZ7FG0bq8SSadY
         4XYI0wmCNc+egMN3AbhXT1KeFP5LlPqY0RESKKkiQGRU6IxvYjlIlpSLY+FS1rxsovRY
         aUFcZSXcqIz0p5w7hu9xUJlrCy70usqiurvMn/Fny0x+5hHBb4YRUipvQm48hYu2m2qt
         z2InQnkDJqFWUJVcxCzSFZfy6NDkmd2asjSQ5jEGj2I/WjpWdU9y7bASiNyVbOSN5mRp
         hqWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770717229; x=1771322029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEYSNWOQV6E13o+30W3QX8BMHVywb2NGF4ndnphpGA4=;
        b=cEnUGnby7F+AMXhL1riyBkAvQkCT6SmqJ13GL8wTdQCNXUXnzx05ZpblyUDQct4JvT
         bZoXw3KENLfOCh5AVsPLalsqXFMgornsZF95o860zUAGrthJx1n4QHtMWcnjP9SiymiN
         11oa6EIyQp/8ReikamO2r6Robs7XLhn9A9nzRbp2wng5J4oM3+/SPde5WvUeT9YnZ99P
         c/0TbdM4HVEfFOvJQL9iT19DI6XGje6vgUYDiVc/7gCX7QmF7OrrN9r33zO5sWiDOTWG
         f+camrMysYcDgP80BiL3G3LxL2GMousxI7/28EpOa0PX9PiOMMCLAktviJWY61jYnOW0
         Sm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717229; x=1771322029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TEYSNWOQV6E13o+30W3QX8BMHVywb2NGF4ndnphpGA4=;
        b=m8R/oLzz4ZwY9Z7puSNecRbnpkvJmi0YzinLuCveN2thoUxPxlv53tTVNXaBk0uvC9
         +qqBYjA2fwT/tuxOiHA7YFAEjKY2dfPShjL4op0EGcAIdvBR+N06PV9RuC7JOZZD2CYw
         zttBumyF/g4JOUuIimz9BNTXzXvSUZl2qnZAr+SgWMrt1+13E5yuGw3C8gICbHkh/F7P
         IOL8CUYl8qbO12VjE7JEy9ENNOPztZ2MDPL/dmzpNIIYi9n2m6oat7jllxQ+K47suAjN
         ZqlmoA4V0v/lMfCKLAl60IGLiU59894QSN5Pbuq0oMu26rs1WkfC243W2ZkDVVuA9IUv
         JdUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM1lSQkYjWGGoJDdpjB4QtRcBb+urExJvVXA/DHsLNw7tnoyTAuchBZcPf1QnhmII5uNZK/whkZaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaAcOHZrjVMN+Wb98IwMhbEtx1+78yA8PoRE9SSn2f/jkKHzNP
	1xa/bv0TMtrZ8cqNvWdrK3zK9HG1UQrg0CUQeh8OVrmIOHmlylX/NXynhZQXLC3YSC22z2+Xkke
	ZlFA4mxq4h/Mprs8E5G2PSUh/a1sBwtc=
X-Gm-Gg: AZuq6aKqeo3Oe8YlrdSOtN3gutbU4d8ktR0aI3dfXg8ZHNbn3+EoFReE5F8nl5g+AbF
	ik76LkgN2+bvrYw/3tBMDCYOxyr5pGjU+Ke4905LffxnfEdD2O2Iq2b5YW/FFjufRpCbrW50AGM
	4VuLQskQHwUOXbuC/0WKhAOoYgYK5o1tcsArXwZyxgDvsj2D3OvrLhk7R4Z4+DtTEW5qd6FkoCA
	S6uI/VcLJwDNPKgrhFV3bMdHosELu4amdVcMZxAigcmpDQLiJ0hRPzYsAnsnquNpuo7QcAZIUFZ
	MLmA3v5q5kA3/reMoCB5ES4w2jQtlw4gFZG6B2uGQcN8jA7ZUhuCoW0vEZ69VlPBC5zF3wKh9a3
	zJl4RcONQxI3tbE2RTskACQab
X-Received: by 2002:a05:7300:d506:b0:2ba:674a:dbe8 with SMTP id
 5a478bee46e88-2ba8cdbea18mr186901eec.8.1770717228681; Tue, 10 Feb 2026
 01:53:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209105456.1551677-1-mkchauras@gmail.com> <20260209105456.1551677-3-mkchauras@gmail.com>
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
 <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org> <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
 <aYr9c90CWAXZ3AVl@luna>
In-Reply-To: <aYr9c90CWAXZ3AVl@luna>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 10:53:36 +0100
X-Gm-Features: AZwV_Qj-Kgu9bLoO-gKQAEhUKyeEsXtfDicIFD8WGPBwV1O8UBQ_YNqmy8D86Ug
Message-ID: <CANiq72nrmaczPQQrf6xjQrT4j_TVghE2k3CrwJRs=R1tZgiR5A@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 10:42=E2=80=AFAM Link Mauve <linkmauve@linkmauve.fr=
> wrote:
>
> I=E2=80=99m just an unemployed contributor, with no ties to any of that b=
ut
> sheer interest, would it be ok for me to join that call as well?  I am
> interested in resolving that issue in core, only three types have that
> issue and only in their formatting code so far.

Sure, invited -- and thanks for wanting to solve it! (I asked Mukesh
due to the IBM affiliation -- I didn't mean to exclude you, sorry).

Regarding the issue in `core`, for context: if the solution involves
adding `cfg`s, then we will need to discuss how to approach that,
because years ago we wanted to add some to cut down things we did not
need and they preferred to avoid to keep adding more conditional
compilation, so we only got the `no_fp_fmt_parse` (ec7292ad3c35
("core: add unstable `no_fp_fmt_parse` to disable float fmt/parse
code")). At some points in the past we discussed a targeted
`cfg(linux_kernel)` one (instead of several different ones) to avoid
that.

Cheers,
Miguel
