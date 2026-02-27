Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1F5355F2C
	for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 06:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174111; cv=pass; b=Vca64aRhOJ/Suu6Hi7yUpJKa1gNsx0Lcv7ndMAFrg8m6aPu0TJ+VKSg2bX2KDdpPLmIAu84rekIh7lYpqM9UKaz9q83Z/dYMIaWORsTu7zuC1HVY+X/4OPklESeUP1sl70C+onSW4UfuNaU2Jq00mCrkhLJyRCOHrxb6RJeuMeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174111; c=relaxed/simple;
	bh=gGxzmXjY9SbWuXMhHQnBpU0orZgk3BtEHZo3GxuM3Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWMD2gfi1FoY52DtGKIAvaQ98FDX4cOtGNqg6x1lT1ThBDK3GfUx1S8Mweme1Tjif0y5jW7S2BzENVehjsIS7vx7Q/SD7AirZq8vSHE9/LBxK+fcGEOF6wiAZYL4BWmA79g3QB1IQ9IZXcvfmTovwVI2QmUYNsWX7pSD2q7xZBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=udLOHJ9K; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="udLOHJ9K"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2adb1c1f9d4so56995ad.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 22:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772174109; cv=none;
        d=google.com; s=arc-20240605;
        b=GAnIAI2YWAnBjcZPsYQUlvNssc74ZdUpZ8ukIG6xjWqmbijuX3hL0A25FKQerHhFi+
         0FXB48lpY31eIlbzbGOtDt6KfkSy42SzSeT0TRKSkDRiuEoBg9Z/0Mbo/xfkTBmRdVaT
         wV+Bp6/DeC0tA4OywumqfUyO7MIyuXid/SRvlCAePF/6syoJ0J2YraL35UPFPmC5jJn2
         c3plAdZLMB8dceMrG2sqUdWcXQ9nHX/8WGwX+0EZ2oTRx7p7nB7j7GUh89z7xwJbP+2x
         qYNUNGAZ5G28gjiegY7BTKHL0621lbIlR6LBID4GOGRwQ6f6Rb85+Zh4LfZGpufYqura
         1tDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5vaa8akeEgfUaZjeRn+BA3sQx4L7fWbq7ZmVurp4ODs=;
        fh=azRAJciIsKc6rILdwpKZ71xqQWm1hmoev4sqWsIo3ao=;
        b=gYyKO8T26wLmTNgPiYcvChQwPgdS5n3PtEpzDIvS4iRdOhOyiTn+yv1TE1b0YWDicr
         GvHuXP2LbJtqOvnzeilMVmg6q6IlmPoBK6rugTfDgH+1qSBtaUNWeVuGB76W0A1LIGAJ
         8XByklEjoBKKs1A0JMx8MHV0dRSShcfWHQVDv3pWhKODFaunpJP+GcqEJXVqjFMlRuhN
         H3MZL3FMb4ipTOja08hElMBJhRcEkSmHDJmJzT1bGrgBzX+HXTkTkHJU0i7JFP1qz8dZ
         MhEu1CplUNS/PwPySdicLcIVuYm3EtGuBqvW789i6oGN7rOgvYGOE80df5aO8fYbkJRT
         qDxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772174109; x=1772778909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vaa8akeEgfUaZjeRn+BA3sQx4L7fWbq7ZmVurp4ODs=;
        b=udLOHJ9KnAe6WWcjXhYn7r0ms1pxAvcm3bSYcele+NQWjlUoG2EvNeEONsELfNW2EO
         rzQFLrTsdOiUfvBFaPN5ufgkC9kFcCqbFzxMhaKkLRjeO+IO8KRrATAF8Db/U16F3Svb
         5r77NhEELijbyGFXYEbWYzIQdTvCYYiZpmXIfF0uz6kLPyJD8T896Nc8Yh4aimgXR7kJ
         sfd6xHVVVNyIf61oEo34ZSg3MDSks52qHuSJ7luiugxiTTjhaX/foo8enGBgbBWtsRMd
         vx4XUAONYlv8jC9UiZR6tZzdk5F6HzZvPtr8sfeQSdCCECyawrM3eST1qNwldGlEmQes
         ms1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772174109; x=1772778909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5vaa8akeEgfUaZjeRn+BA3sQx4L7fWbq7ZmVurp4ODs=;
        b=rBOjdf9EUkeasOuKOIHPl6UZPMwIll3xxJxlpAX2Evf5Dd/Emh6D6Lpc0+r7yu/9JX
         8YiL/ZUnNQIlsQWxXjTsFIMZbsPLPQh7oGJNnoAmQCHOWWatnJVM/qdC7tV49cGfm7/L
         MU+JBc0fmIfIvZnlU73zL4DBa06pi7UxsAV2q5bbKX0M9U8pVtukZgTuabmHOwaEbRC8
         aOJd0EJx1TuzZxRG1zmCka/Zwi0EAHXlhFRGvCX2WmQqsHehRCCL5VO6TQZ0ZuMavSJm
         8jI0flYgC9OBnnkd2vl+5jii+w6oRHvF208AlbBoLfD2R9Qevl4Bk2Z4UOedECubQK9N
         LT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWhk2pdv9OOcB23EoLt1oFeH442JRGVs/hlKDBq7OmLpslMbAfInrbMw8raevVdCgdE7amathvbMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgyxsJqC1vclBPvxpiSKXyz66W2zc/ltUIZisraK0FCjrykDNb
	NopA+vcWN6P6SOhfPHYEpaxFwEqr3fwaxIsUnQeL2AnjNysW5WIMVC5FB2byzF8NRg432Z69bYT
	JOHvU1A11oGlZ0WJzZlu1NCwmdhTCL+GFuR+K79+f
X-Gm-Gg: ATEYQzx1rIINBRFGWzWBZu9OyY0VSMx8+EuRqcsY6C6Zh02FGz/J16OTJJEx+YYZdVW
	Ldrwzp7en4feB27NAyvunmihRa1WIUiq1EMMxcSzyNDoKQ6PRUSWoXgDTZ1AMyHv6WXNJxdvW9F
	kZhhl72JHh2hS3/6Q20WR2zujQ2S75Z7/ec51VsoLcBjnbs/XKMh3fhkmPDOvGb58zWQe2NxC7f
	rLrR7pbZ7HX7d8RMjx61DwgaIMck7k29O3rG3HVR4U9997pJkAQWsmZBkhGq70JSi+jFn9xJMKk
	W2+wK/MSnJRM3b0yYhs9m+BqQAXicEUWJLxp96cR
X-Received: by 2002:a17:903:2a86:b0:29e:27f4:bac0 with SMTP id
 d9443c01a7336-2adf77c692amr4716545ad.16.1772174108996; Thu, 26 Feb 2026
 22:35:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820010415.699353-1-anthony.yznaga@oracle.com>
 <CAC_TJvcaJdEzK8n9BK0qgEXdzjzXtbA_Zk-ybfmG8kjNExVCzw@mail.gmail.com>
 <b82a5ac3-33e9-4cbf-892a-f0c7f6fe0c20@kernel.org> <CAC_TJvdgvyjyJsU4v6W+3tHKx_2e8UMJU3RT2HKLSngcC+yH3Q@mail.gmail.com>
 <5tdailzxoywzzunbwhtlk4yjfmzunntniqtudkb52q6hib74ql@oq4mi226dedv>
In-Reply-To: <5tdailzxoywzzunbwhtlk4yjfmzunntniqtudkb52q6hib74ql@oq4mi226dedv>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 26 Feb 2026 22:34:56 -0800
X-Gm-Features: AaiRm50sVIIQTfT7ctHM4g1t99KQJhS99wa_T7m6oioVRZFMpAuvQzucC4RWMJU
Message-ID: <CAC_TJvdC+CSqvx+BvOv4gO2mJbwiBhb6OZO0sx=GXQ0CmA853g@mail.gmail.com>
Subject: Re: [PATCH v3 00/22] Add support for shared PTEs across processes
To: Pedro Falcato <pfalcato@suse.de>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Anthony Yznaga <anthony.yznaga@oracle.com>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, andreyknvl@gmail.com, arnd@arndb.de, bp@alien8.de, 
	brauner@kernel.org, bsegall@google.com, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dietmar.eggemann@arm.com, ebiederm@xmission.com, 
	hpa@zytor.com, jakub.wartak@mailbox.org, jannh@google.com, 
	juri.lelli@redhat.com, khalid@kernel.org, liam.howlett@oracle.com, 
	linyongting@bytedance.com, lorenzo.stoakes@oracle.com, luto@kernel.org, 
	markhemm@googlemail.com, maz@kernel.org, mhiramat@kernel.org, mgorman@suse.de, 
	mhocko@suse.com, mingo@redhat.com, muchun.song@linux.dev, neilb@suse.de, 
	osalvador@suse.de, pcc@google.com, peterz@infradead.org, rostedt@goodmis.org, 
	rppt@kernel.org, shakeel.butt@linux.dev, surenb@google.com, 
	tglx@linutronix.de, vasily.averin@linux.dev, vbabka@suse.cz, 
	vincent.guittot@linaro.org, viro@zeniv.linux.org.uk, vschneid@redhat.com, 
	willy@infradead.org, x86@kernel.org, xhao@linux.alibaba.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, Isaac Manjarres <isaacmanjarres@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, android-mm <android-mm@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 1:22=E2=80=AFPM Pedro Falcato <pfalcato@suse.de> wr=
ote:
>
> On Wed, Feb 25, 2026 at 03:06:10PM -0800, Kalesh Singh wrote:
> > On Tue, Feb 24, 2026 at 1:40=E2=80=AFAM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> > >
> > > > I believe that managing a pseudo-filesystem (msharefs) and mapping =
via
> > > > ioctl during process creation could introduce overhead that impacts
> > > > app startup latency. Ideally, child apps shouldn't be aware of this
> > > > sharing or need to manage the pseudo-filesystem on their end.
> > > All process must be aware of these special semantics.
> > >
> > > I'd assume that fork() would simply replicate mshare region into the
> > > fork'ed child process. So from that point of view, it's "transparent"=
 as
> > > in "no special mshare() handling required after fork".
> >
> > Hi David,
> >
> > That's agood  point. If fork() simply replicates the mshare region, it
> > does achieve transparency in terms of setup.
> >
> > I am still concerned about transparency in terms of observability.
> > Applications and sometimes inspect their own mappings (from
> > /proc/self/maps) to locate specific code or data regions for various
> > anti-tamper and obfuscation techniques. [2] If those mappings suddenly
> > point to an msharefs pseudo-file instead of the expected shared
> > library backing, it may break user-space assumptions and cause
> > compatibility issues.
>
> I'm not worried about transparency because this is not supposed to be
> transparent. This is not supposed to be used by most core system software=
.
> This is supposed to help replace hugetlb page table sharing.
>

Hi Pedro,

Thanks for the detailed breakdown.

Firstly let me state that my goal definitely isn't to derail or block
the current mshare efforts.  I'm mostly just trying to gather feedback
on what a "transparent", approach might actually look like.

> Transparent page table sharing has other constraints. I like the idea, in
> theory, but there are a number of constraints that make the idea unfeasib=
le
> for now. There are a couple of problems we need to solve first:
>
> 1) Every spot where we modify PTEs needs to be assessed and use different
> helpers (that can un-cow page tables). Every pte_offset_map_lock() can no=
w
> feasibly fail for OOM reasons (and that also needs to be assessed).
>

What if we strictly limit the scope to just read-only mappings being
shared? Would un-COWing still be necessary?

> 2) Various bits of PTE modification/unmapping now needs special care wrt =
TLB
> invalidation. The kernel needs to be aware of how the page tables are sha=
red.
> I don't think the current rmap data structures are well suited to this ki=
nd
> of stuff (perhaps with Lorenzo's WIP anon rmap rework we'll get something
> better). Basically every spot that goes "modify PTE, flush TLB for mm" no=
w
> needs to go "modify PTE, for every mm that maps this page table, flush $m=
m"
> (if you're thinking that COW will save us, it technically won't, or shoul=
dn't,
> because of stuff like try_to_unmap_one() that is used in reclaim).

I think this bit might need to be architecture dependent. With shared
TLB partitioning on certain hardware, this becomes much less of an
issue. We could potentially gate this behind something like
CONFIG_ARCH_HAVE_SHARED_TLB_SUPPORT (or a similarly fitting name) so
only architectures that can handle the invalidation efficiently opt
in.

>
> 3) Reclaim loses even more information as now N processes share the same =
A
> bits. I don't know what effects this can cause. It would require
> experimentation. Perhaps something like "if page table is shared, value
> pte_young more". I don't know if this can work as a bandaid, but it's not
> ideal.

I agree this will require some experimentation. Intuitively, I like to
think these shared pages might naturally stay "hotter" since multiple
processes are accessing them concurrently, but we will definitely need
to experiment with the reclaim logic to see hwo ti does in practice.

>
> 4) It's not known whether page table COW fork() is a real win in most cas=
es,
> or all cases. Would want measurement.

Our preliminary data on Android shows this can save ~200MB or more on
mobile devices right after boot. On memory-constrained client devices,
that is a significant win.

>
> 5) It becomes even harder to estimate RSS and PSS for each process.

For PSS (PAGE_SIZE / mapcount), I can see that a single mapcount from
all the processes mapping the page through the shared page table would
skew the result. Though, I find PSS not perfect already; I think
processes can artificially lower their PSS by mapping the same file
multiple times.

For RSS, I'm not sure I see the blockers to aggregating across the
private and shared mm_structs?

>
> For these reasons (and more, certainly), I don't think working mshare() i=
nto
> a transparent, all-great thing that fits the zygote model can work. It ha=
s been
> discussed at length how to pull off certain hard bits like TLB invalidati=
on and
> locking for mshare, and with mshare we have the advantage of not needing =
to
> support every feature ever (tailoring it more to the big database users o=
f
> hugetlb). And we'll still need to adapt certain bits of arch code just to=
 get
> it to work efficiently.
>
> This said, if you want to discuss pulling this off, I'm all ears and it c=
ould
> be perhaps a fun discussion (too late for LSF, I guess), but I don't thin=
k
> it's workeable into the current mshare efforts. And, believe me, I would =
love
> a unified feature here :)

I saw Anthony proposed an mshare topic for LSF/MM; I hope to be there
as well, it would be great to chat about this in person.

Thanks,
Kalesh

>
> --
> Pedro
