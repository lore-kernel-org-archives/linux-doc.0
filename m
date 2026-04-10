Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5963D9DA9;
	Fri, 10 Apr 2026 15:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835161; cv=none; b=KGxV3k3WDZLUeb4rud+hfgDFft2j3PBRDfm45sd0Ape2io7fOGjIdmxwiOBE2ZnErIDWXN9l42l/qNyV2s+UZlq24MDrr4NLPupSIz3jt7yI06GgRz+972oTvdOBKTDoP+9cS/y3LfwagIMX5VKB0b2XGDtODbwXdr3TKG6pY3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835161; c=relaxed/simple;
	bh=GBAdj1OeraoE9U9rcglYmL//6HRez8BdY6SSpSLzDqI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gIOuihGaLNRgF4enM3dsivhHd+qPYJZseOMgRNXechJSrp+IIx9l/1NOucGHUQTnXIPIV49Col9fYBqU+o+aXbNnrmxKk70Vn/SFSSXIU5b15mLe3laVmyorhc+/BzbGMCQOJPNEuE7EqRhr5UTtku3iW/B0Jwtnu1nDDw5qF8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTD7w5M9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTD7w5M9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F33C19424;
	Fri, 10 Apr 2026 15:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775835161;
	bh=GBAdj1OeraoE9U9rcglYmL//6HRez8BdY6SSpSLzDqI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bTD7w5M9eVclP0GT1PCqzm6j61koq0QURuVGjwg0FDqsulB6mXCRmvW4niiSgkSXw
	 ut+n2gk7ui0wqAxjyfKAZzk8TDcFStfPuR/IMmyoq640QA7hycOUxax86wRjOBxW6+
	 GDeGmuc105DHearFsAfDjEJ9+aaJXoc/6yOaehtDU6i0lXkmZpfNq5o17St+UALaWa
	 ScTjuo5Cl57LBiEpL/XgT6+WtYMJ7Hb/ItIGZHjMvEJOcuLrpaz5/oEWgOBuB8LN8m
	 W1VcvMpXM1LHxVlHnYEM1BWcY+P9BC3i6AIsOEfb0X6bcuYG0R3A9uDLtRIAwJtE6g
	 /GYQdVyzJmKhA==
From: Thomas Gleixner <tglx@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Aaron Tomlin <atomlin@atomlin.com>, Christoph Hellwig <hch@lst.de>,
 Frederic Weisbecker <frederic@kernel.org>, Jens Axboe <axboe@fb.com>, Ming
 Lei <ming.lei@redhat.com>, Valentin
 Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, John Ogness <john.ogness@linutronix.de>
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
In-Reply-To: <87wlygb3wd.fsf@trenco.lwn.net>
References: <20260401110232.ET5RxZfl@linutronix.de>
 <87wlygb3wd.fsf@trenco.lwn.net>
Date: Fri, 10 Apr 2026 17:32:37 +0200
Message-ID: <87qzomzv8q.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 09 2026 at 08:32, Jonathan Corbet wrote:
>> This documents what we have as of today and how it works. I added some
>> examples how the parameter affects the configuration. Did I miss
>> something?
>
> There's been a lot of silence on this one... should I pick this one up,
> or are there other plans for it...?

Looks good to me.

Acked-by: Thomas Gleixner <tglx@kernel.org>
