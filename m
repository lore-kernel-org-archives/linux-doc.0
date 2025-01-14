Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0E81D5145;
	Tue, 14 Jan 2025 18:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736880015; cv=none; b=QUAeXHEkuwS9Hz67HK3js1PLJNbUYh3us/Of3lXOqPyxBoxWNkkG9+uCTZ2fzqZqrr9wh5nCPAnbE3hzCg/cyJxfIG2BKuuonGy2yEJLMsSc3q7zOYFGRm6dsAILCBf6c9OnNtzQKTjh0GsZflncOaAbL7sj29YXcprrkSjxLxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736880015; c=relaxed/simple;
	bh=q0HGA7bIdyJoq59IQaKBS40fl5r/Pmq6Px/lXZJU1Bk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MHsdYI+vXuv0m/W4nc7efdnn0n1XQq6gHbu5a5IyGBdZJ+30aNsNb1J+6rb7uXqpSmGlfLzEtxnR+54CCntAj2QR+O6eloEiOBMPA3BfQl1MG2SQKvF6PYeH4ofG3udLkajZ5m3sFYPOj3mkAg62DlkBRohPcrrnyXp5kU+e8SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=a4EYFW05; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="a4EYFW05"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B5EDD404ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736880012; bh=G6PHnRGs2tYVzR6+Zfz9BIbu8Fkin0nBpCuYqsdfvPQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a4EYFW052VpX/YQnntTZlXNYAOIKvKY6NMqUswniA9/Hl2Xd/LRjhKtq/JQzvZtBi
	 1Ii8FyVpP3lglEiajFzIPiiYNAmOkGKboNPFsMzexOmbQS4HzEYlQVyUfQ3lvK4DdZ
	 DFeBUu0TbJqvKYu+DPAjatONo5sOowLRYr7M5eoF292dmEYRD5B98Z8Ky2Wg8YiX4D
	 yNPqhppn+fH599/POPrAECUB2NuxcFMSd7PbSQYMfL+L9dMgVkv2CPrAvkvwZ1FUN0
	 1niQERaM7gpCkt/PIxJ1fOHiekm+87L8qq/agLLaQWblg867RU394O7T+/57/8z258
	 Zk4LLK3FAhy7A==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B5EDD404ED;
	Tue, 14 Jan 2025 18:40:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Phil Auld <pauld@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/sysctl: Add timer_migration to kernel.rst
In-Reply-To: <20250114174308.GA149002@pauld.westford.csb>
References: <20250114140301.141147-1-pauld@redhat.com>
 <877c6x9vcy.fsf@trenco.lwn.net>
 <20250114174308.GA149002@pauld.westford.csb>
Date: Tue, 14 Jan 2025 11:40:10 -0700
Message-ID: <871px58cj9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Phil Auld <pauld@redhat.com> writes:

> On Tue, Jan 14, 2025 at 10:08:13AM -0700 Jonathan Corbet wrote:
>> Phil Auld <pauld@redhat.com> writes:
>> 
>> > There is no mention of timer_migration in the docs. Add
>> > a short description.
>> >
>> > Signed-off-by: Phil Auld <pauld@redhat.com>
>> > Cc: Jonathan Corbet <corbet@lwn.net>
>> > Cc: linux-doc@vger.kernel.org
>> > ---
>> >  Documentation/admin-guide/sysctl/kernel.rst | 7 +++++++
>> >  1 file changed, 7 insertions(+)
>> >
>> > diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
>> > index b2b36d0c3094..e03691e2cf4a 100644
>> > --- a/Documentation/admin-guide/sysctl/kernel.rst
>> > +++ b/Documentation/admin-guide/sysctl/kernel.rst
>> > @@ -1544,6 +1544,13 @@ constant ``FUTEX_TID_MASK`` (0x3fffffff).
>> >  If a value outside of this range is written to ``threads-max`` an
>> >  ``EINVAL`` error occurs.
>> >  
>> > +timer_migration
>> > +===============
>> > +
>> > +When set, attempt to migrate timers away from idle cpus to allow them to remain
>> > +in low power states longer.
>> > +
>> > +Default is set.
>> 
>> When set to *what*?  It will always be set to *some* value, right?  So
>> we should really say what the specific values mean.
>>
>
>
> Well, it's boolean so set means 1 and unset is 0. I was using the same
> style as the one below it:
>
> "
> traceoff_on_warning
> ===================
>
> When set, disables tracing (see Documentation/trace/ftrace.rst) when a
> ``WARN()`` is hit.
>
> "

Just saying it's a boolean would help.  And our existing documentation
should rarely be taken as an example of what *good* documentation would
be... :)

> But I can change it to "enabled (1)" or something if you prefer.

"When set to a non-zero value" or some such would, I think, be a lot
more clear and make a better example for the next person to come along.

Get me an updated version and I can still queue it for 6.14.

Thanks,

jon
