Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700613;
	b=b5ojD8nuMR9IQg5etAUE9zL+xxXxwN1EY2zOGSSCk/zBdY19+0bTtc2kJaguMsQIMcMm
	 MhpyEpkQf62NXBIoCKklTexOVv5xMJeSb5zXjqJuB6rnBvEK8DzpDlwt8MRtSfEHv7sei
	 fHraRzD4KkGNM3g044InyAVKFo8eDGEcM9mN5RyyHI5YQQxSt2NHtmWxgJPkNiavqqtdf
	 r+EpYO5gwF6D3HtueTAt9uwUw+d1dAzim1Sv9kdomOpSu1o9y000cmJiR7zIGLQNvPqC/
	 6L5jXeO5wqnf786Pvv5pehfWry/p2q33gQU1Jmf0aF0TAZtqv/ECNCiNqvHmtYmJNUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=amuDM1XErH3iNEOGYc3quFOh2xV3FDKDTqioT+ZE0VY=;
	b=NtY5ISMadVXDHPWVN6YAOGV96hwtyI/PgTbfIKQGhVmIuQuVzb+yQCxNtwgAEqLXHzP7
	 jMgx//iufI2LqMLT2yVB16SZNw3VvAnsi/cMzqvEqMMTeQ71XNgPukFwKABNYtj+sHmCi
	 pMjXBeTnMUoy59rG0R70a4VzjxzLhPINTy78SP/tfBzgBwqyhZLXnAjh4/UMKZBxA2e3l
	 L4eJv7lD1VyFNGmhOnJw4UjMiKYse24KggdnxX+eB/M/JLyMsHRQNMhV5sBAntyC2vfxX
	 7HadegXGpeCK+/56qwLyPopp+8asVEhug2hRX2WTmIKQtasP/zC2zTM9FB+A1a2oXag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B60606FAD0
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 10:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B60606FAD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so38436515e9.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 02:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793700606; x=1794305406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=amuDM1XErH3iNEOGYc3quFOh2xV3FDKDTqioT+ZE0VY=;
        b=D3lfzvgllAy66yjpM83+uVVVcHqBsQmU2iC+S50qheFJh6Z6HrWBQnekbhCeCv4G+Z
         Ra7rGFAhRkwcMI7hBAHXNoP+sPC5vG81oHR9q31T72khBBTfIVMX4B3zofHI7kIbBEYg
         x+ofObQJpGGSsUuCYsnXliGlh2v3iYfKt1YEeEpM69NKsfEhZ00em3D/KLP+xKWYAs5t
         l3Dlm0C34JuOlxS+MkHfDJ08Gz+4l4agLbQLAO6e8QdvGnDMiAv01PEoXmcOePIVwn0a
         3um1Fgk+lesN7MsnVgbsjCzOTGy7nwX2/fPB5f80Md8TlWs4k1hIrlA3TGvR85RBYNO8
         /sDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700606; x=1794305406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amuDM1XErH3iNEOGYc3quFOh2xV3FDKDTqioT+ZE0VY=;
        b=IeAbhSjo/PRS6TPJVhYT3rPSGdLWTxqMD4NDK4sEfsT5JmBldjkewx+Viy1z2LEl1Z
         kvf9nkTyFgAra19mP/V+V1LsLBFjtC1FoNnPK9tsnNuPbWDbH14YmmWiHmkkYBC52ZNM
         YnLzsNui+k1XArvhgZOO3jPvL6JBsfqVu2ZRadnh1p6wpcLY/eOcnV60jQ7U6qS+imCX
         e/3drWVXRk3Y6+eSiqIVc3Awmh8wWoVzyvpAJXqCsD3VkjgA85RethiEf0g96e1eNHig
         Ll3aANO6logzxIpNjiQfvAx2Tg5SgeqwtCtlYqspXYoxhWHzFhNQQymkFlewtg3KzKjI
         Ztlg==
X-Forwarded-Encrypted: i=1; AKwUvBzF2K0e42HC7QxSIet/Bbh4sbo75nT+kKuCcTCjPKzBjVwMe1EYGAD6r+oCjRPa8EcNz/CdUlk4Qw8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FfztM6pFtFT/5XYTdX/wOWs6t2+XqSBo9UnbJPr748DOx9b6+
	CM+KhqoT1o4BzE870+PwgKlnAUpDxgIduRw/77lCYRF6IiH3NQ1czKjOPDlqjEq/wds=
X-Gm-Gg: AYBFou3InIlnZVZoRPP+LyF74Js1mCYlZAQFePqXAdCZfDrszDHk6euSLEQuQ9LqIhF
	9XOp/dD2swbsFEIjEqSb3skyQdopSMBGXP/8MNod9kNxGvey5pF0WzdF6HeLHuypKdPdG5dKLS1
	Xxe3PqDlssdI4jbZhL63ac+X+wC+BUobuqYh0iAJfnf58YkT3Z03soqgfg6qMkj3s81uEiWzvu6
	DsiuHQjSd0Ft2VKXdHHLXPhsfV7TRNG62ANZ1bEp9HKZQHzSuy8FCjFIJLckwCruvPNcMWw49dI
	nPTNqeJYda5a8hyJoXy1GVOJ1yCjSIkDiaMIVBrAqzz0GsAOBqWpS9VJv/ULeEp/OnMNWWdB1v8
	ycWI/ON4PxVBvlRXGfaE0MFe8jfKqg7RAUp2Ze+zxPH4UiB3ioaXC5GGnt5qsZm+RvLzPMs2X5+
	uqSqKs0gYuG53sHJ45ZrQp+g3lb0J9n/V32lpOxw2+uVKDD/oc8kk4pjRUwGDH6FE8KtEJd0nkw
	qPCYRksNLNeZsdV9GjeAu+btpa7nkqcN1BWR+Eij4w2KOiPG9mrtgH1YUPGLbNBboamJDMPwM8T
	J2BQcSMOlG3pUAciwIPbNiWlr0EjO0EiByGG
X-Received: by 2002:a05:600c:3110:b0:4a2:883:4adb with SMTP id 5b1f17b1804b1-4ac18b7e059mr294027715e9.22.1793700605595;
        Tue, 03 Nov 2026 02:10:05 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77c132sm231363455e9.1.2026.11.03.02.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:10:05 -0800 (PST)
Date: Tue, 3 Nov 2026 11:10:00 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <aumpp4VptzmasuX8@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <auOT1UwdNt67XfTq@MjU3Nj>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auOT1UwdNt67XfTq@MjU3Nj>

Thu, Oct 29, 2026 at 07:43:33PM +0100, sergii.dmytruk@3mdeb.com wrote:
>On Thu, Oct 15, 2026 at 04:50:33PM +0200, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>

[..]

>
>Hi,
>
>I have no say in kernel development and wasn't trying to do a proper
>review of the changes (was mostly understanding them with regard to
>DRTM), so take my comments with a grain of salt, but I do think most of
>them are valid.  I also get this is an RFC/PoC type of thing and

They are, thanks for the careful read.



>sometimes generalizing from multiple locations, those types of comments
>do not apply to all instances and specify a general direction that seems
>helpful.
>
>Overall impression
>------------------
>
>I was surprised to find that 80% of the changes in an attestation RFC
>are about a new kernel interface, which is also proposed as a potential
>future API for many other things.  The cover letter mentions it, but
>doesn't do justice to its scale: YAML specifications, code generation,
>serialization, deserialization, actions, events, etc.  Things like
>CORBA, COM, or D-Bus come to mind, even though they are different in
>many ways.
>

Fair, CTLV is the bigger part (with the generator and generated files
too), and it is meant to be general, with attestation as its first user.
It is closer to netlink than to an RPC system though: no objects,
proxies or daemon, just a device fd, one ioctl, and messages the kernel
checks against the family's schema before the driver sees them.
Ment to be easy to use and error prone as much as possible.

RFCv2 will be smaller too: it will leave out the events and the
MR journal as well.


>I feel that something this size needs to be motivated more thoroughly:
>
>1. State goals of what an interface aims to achieve, why it can't be
>   done with existing measures, or how bad it would look when using only
>   what's already there.
>
>   This is mentioned briefly in the cover letter and has surfaced in
>   various responses, but it should be stated explicitly given the
>   objective of proposing a long-term interface.
>
>2. Maybe try defining conditions where CTLV is applicable and when it
>   doesn't make sense.
>
>   I saw changes to this effect in replies, but it could be done more
>   systematically and compare CTLV against existing alternatives to show
>   where it fits among them.

Agreed, RFCv2's CTLV doc and cover letter will open with that.


>
>3. Specify elements of the design (e.g., schema, actions, events, a tree
>   of attributes, a single `ioctl()` operation) and how they serve the
>   stated goals.
>
>   For example, what use cases are enabled by partial responses?

Will do.


>
>4. Explain how the elements are to be represented, produced, and
>   consumed.
>
>   That is, the actual tree structure, information about padding,
>   generation of the boilerplate, what parts are to be provided by the
>   programmer, etc.  This is what existing documentation contains,
>   although not very structured.

Okay.


>
>5. Possibilities of future extensions (compatible and not).
>
>   I haven't noticed versioning, but suspect that a different `ioctl()`
>   could be used.  Types or fields can be added and ignored or can fail
>   parsing if unrecognized, but this has its limits.  The stance on such
>   changes should be documented, so it's clear what one might expect
>   going forward.

There are no versions, on purpose. The ioctl struct carries its size
and grows only at its end. A family grows by new ops and
new optional fields: an old program skips what a newer kernel
adds to a reply, a newer program marks what an older kernel may skip in
a request, and op-schema-get tells it which fields the kernel acts on.
Anything incompatible is a new op. Each family also has a checked-in
ABI snapshot, so a uAPI change is a visible change of that file, and
the checker refuses removing anything, narrowing a bound or making a
field required.


>
>Having experience with parsing and producing TPM commands and event
>logs, I understand the motivation for CTLV and see how it can remove the
>most unpleasant parts of dealing with data of this sort.  However, the
>machinery necessary on both kernel- and user-space sides is quite
>elaborate.  It can end up making even trivial interactions hard (try
>using `dbus-send` to retrieve some information or see its C API to get
>what I mean).  That's why I feel like the motivational part is very much

For a trivial interaction there is ctlvctl, which needs no generated
code, only the family's YAML for the names; the cover letter has a few.
In RFCv2, reading an MR will be:

  ctlvctl query /dev/attestation/attestation0 mr-read id=1

with CTLV_SPEC_DIR pointing at Documentation/ctlv/specs.


>lacking here.  Describing the approach in terms of goals and how they
>are fulfilled is also partially aimed at making it easier to assess
>applicability of CTLV to other subsystems by reviewers.
>
>CTLV specification
>------------------
>
>The schema description is machine-oriented and is hard to use for
>humans.  At some point, a textual version will be needed, if only to
>introduce the most commonly used subset.  It has already been mentioned
>that names of attributes aren't descriptive enough, and comments or some
>kind of embedded help would be nice to see.
>
>"attr-groups" vs. "attr-sets" confusion has also been mentioned.
>Knowing that groups are part of IDs helps, but doesn't make it much
>easier to read ("groups" and "sets" don't suggest different levels in a
>hierarchy).

Agreed, that design is unfortunate. I was attached to the netlink and
netlink yaml too much. But RFCv2 will have the YAML in the layout
Jason suggested on 11/20. Groups and sets will be gone: a spec will
have records and ops, each op the tree of its request and reply, and
the comment above an item will be its doc, in the uapi header and the
rendered docs too:

  # One MR's values, and the MR generation they belong to.
  mr-read:
    type: query
    fd-access: read
    optional: true
    suggested-reply-length: 4K
    request:
      id: uint(..u32-max)
      device-generation?: record
      options?: extension mr-options
    reply:
      device-generation: record
      mr-generation: record
      mr-values: record

The generator will also print each op as a call, and RFCv2's cover
letter will list them so:

  mr-read(id, device-generation?, options?: mr-options) ->
      { device-generation, mr-generation, mr-values[23]: mr-value }

>
>Documentation and comments
>--------------------------
>
>Right now, it mostly covers implementation details rather than concepts
>and how they fit together.  This makes it hard to review the changes, as
>the reviewer needs to discern high-level stuff from the code to assess
>that code.  Having a more abstract description that's also mapped to a
>particular representation would allow checking the overall design and
>more fine-grained details.

Right, intention is to change it in RFCv2.


>
>There is also not much information about how the user-space is expected
>to use this (i.e., encode and decode structures).  I suppose there is a
>user-space library for that (saw `libctlv` mentioned), but the kernel
>part isn't complete without giving an idea of how it's expected to be
>used.
>
>I was trying to compensate for the lack of documentation by reading some
>comments, but many that I've seen (excluding comments on functions or
>structures, those were sensible) restate what the code is doing or
>repeat other comments.  Some others seem to say something important, but
>do not place it in the context necessary to understand the statement,
>and thus do not fulfill the purpose of explaining the code (i.e., why
>it's written in a specific way).  It's worth revisiting them in some
>future version.

Okay.


>
>Code
>----
>
>Quite a lot of functions are comprised of two blocks of lines with no
>newlines or comments within them: declarations and the rest.  That's
>fine if the body is small or uniform, but larger functions often have
>identifiable steps with conditions and loops.  I'm not saying those
>should always be extracted as helper functions, but some kind of visual
>structure helps to understand the code.  Given that there are many
>thousands of lines in here, that seems like a desirable property for
>review as well.
>
>Terminology
>-----------
>
>It may be just me, but I found some of it rather confusing, and the
>absence of a glossary didn't help.
>
>It took a while to figure out that "family" means a single-instance
>class-like construct (data, methods, inheritance with virtual methods).
>I also initially thought that "nest" meant a subtree, but it seems to
>apply to a top-level tree as well, so it's actually just a tree called

Yeah, confusing a bit, agreed. Will change to "records" in RFCv2.


>differently (why?).  "stub" also looked weird, but that can be remedied
>by documenting it better; not sure if there is a better word.

In RFCv2 the stub will go, and the YAML will name the extension point
directly: "info: extension device-info".


>
>Other terms seemed just weird, like "file description" instead of "file
>descriptor", mentioning of "wire" and "physical something" (no wire
>transmissions and nothing physical here).  Still unsure what "placement"
>means in various places.

Right, will check those.


>
>If the terms come from netlink, their use needs to be explained here
>too, or the reader needs to be referred to the relevant netlink's
>documentation, if borrowing of the terms is intentional and meant to
>stay.

Agreed.


>
>TPM event log and MR log
>------------------------
>
>I know this will be dropped from this series, but it's still relevant to
>keep in mind and will return at some point anyway.
>
>What about measurements taken outside of the kernel?  I've seen the
>discussion about extensions done in parallel, with the likely outcome of
>not handling this in any way.  But there are also measurements done
>before the kernel has started, for both SRTM and DRTM cases.  A way to
>import measurements is needed.  Am I correct that nothing should prevent
>doing it later?

Correct. The MR values are the hardware's, so they already hold what
firmware extended; what is missing is the kernel's record of it, and
RFCv2 will leave the journal out. An import will belong to the series
that brings the journal back, as an op or a provider callback, and
adding either is compatible.


>
>DRTM perspective
>----------------
>
>While there is no TPM/DRTM attestation provider yet, an RFC seems like a
>good place to make sure this can be accounted for by the final design.
>
>All the crucial measurements happen before running the kernel and then
>by the kernel.  The interesting operations in the user-space are
>obtaining the log and having the ability to replay it.  Also, locality
>change can block further PCR updates, so the user-space part doesn't
>seem to be that important for this use case.
>
>Linux currently doesn't extend the PCR measurements it makes to the
>event log, so misalignment of the PCRs and the log won't be something
>new.  However, if there is a log, it should be correct at least before
>any user-space measurements are taken (IMA breaks this for PCR-10, but
>would be nice to avoid this for DRTM or similarly limit the effects to a
>specific PCR).  Again, relinquishing locality can be the answer here,
>and I suppose that an attestation provider can handle that on its side.

Yes. Each MR says whether it may be extended, and the core refuses
mr-extend on one that may not, so a provider can keep the DRTM PCRs out
of userspace's reach.


>
>Some of the replies suggest the intention for the kernel to do
>measurements using the attestation subsystem.  Combined with importing
>measurements, this seems to be enough to cover the needs of DRTM in
>terms of data.
>
>What remains is whether postponing extending PCRs until attestation is
>online is considered acceptable and by how much they get postponed
>compared to doing it early.  In principle, delaying extending the
>measurements isn't all that new.  coreboot does exactly that on a lot of
>boards, assuming that nothing will mess with its log until devices are
>initialized.  DRTM is supposed to enter DLME in an isolated state, so it
>may as well rely on it.  However, what does the use of this attestation
>subsystem actually buy the kernel for the DRTM case?  And are there
>reasons for all DRTM implementations to extend PCRs at the same point if
>some can do it earlier?

Nothing here makes DRTM extend later. What has to be measured before
the subsystem is up, at module_initcall(), can be measured as it is
today, and how early a TPM provider takes over is for the TPM series.
For DRTM's own measurements the subsystem buys little. What it gives is
the rest: userspace would read the PCRs, get a quote and fetch the logs
the same way on a TPM as on TDX, and later, kernel users such as IMA
would extend through one API whatever the root of trust. And no, I see
no reason for all implementations to extend at the same point.


>
>Also, is the attestation log expected to be the way of publishing the
>DRTM log?  That may make consuming it more difficult due to requiring
>CTLV-specific tooling.  A TPM2.0 event log requires its own tooling, but
>it's the same format SRTM uses.

No. In RFCv2, evidence objects will carry logs in their own formats:
TDX will return the CCEL as an event-log object, the bytes as firmware
wrote them, and a DRTM log would be one in its TCG format, read with
the tools that already parse it.

[..]
