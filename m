Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329F7211F
	for <linux-doc@vger.kernel.org>; Sat, 21 Jun 2025 19:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750533368; cv=none; b=KN1Zl6jaD8MXxSQfZacgvvpYxJBaBpAuQvya+Ehc+m6BjRmWjOGo5Gh77Fo87EvTVA7H0VfovEeSd8jMt29/gnqsSzdq7crne/f6wDsxS7jdeWRlu+LoXxA3j+fHTnkn4EUEODOg9lvpxlyWqomV7E1oC3FdTS3TmOYaRBcYfKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750533368; c=relaxed/simple;
	bh=VzszE2v7N/uGW7CYOMd8anuS8+jwt9aMf5ay7XW+9Yk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EF+Kkdgrfa2sEeFXYQvVVImCoeimLryWnM0MZmiv28uCFxCZXICppQ/HGeSHGogBjUQEeL847X2CibnBAQQqfBv35OlUNWe2305+k98OfAsDEm3aEOT4i2vmEyXP6J4HBNrplgDlLvM/wPb5ZKfnpabnMFkWrNbOJTXrAQ9l1t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 017ea4bc-4ed4-11f0-9764-005056bdd08f;
	Sat, 21 Jun 2025 22:14:53 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 21 Jun 2025 22:14:51 +0300
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-mm@kvack.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <aFcEq62fKMlHDcev@surfacebook.localdomain>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <aFL7frrstgpzzgan@smile.fi.intel.com>
 <0d437b3e-37b5-4e98-90bc-afa6c8150e77@arm.com>
 <aFP7wwKD_yeRRuI_@black.fi.intel.com>
 <92a89dbb-7031-459a-ad5a-69b29b08cfc8@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92a89dbb-7031-459a-ad5a-69b29b08cfc8@arm.com>

Fri, Jun 20, 2025 at 12:23:47PM +0530, Anshuman Khandual kirjoitti:
> On 19/06/25 5:30 PM, Andy Shevchenko wrote:
> > On Thu, Jun 19, 2025 at 03:05:10PM +0530, Anshuman Khandual wrote:
> >> On 18/06/25 11:16 PM, Andy Shevchenko wrote:
> >>> On Wed, Jun 18, 2025 at 09:42:34AM +0530, Anshuman Khandual wrote:

...

> >>>> +			spec.field_width = 10;
> >>>> +			spec.precision = 8;
> >>>> +			spec.base = 16;
> >>>> +			spec.flags = SPECIAL | SMALL | ZEROPAD;
> >>>
> >>> Do not duplicate code we have already in the file.
> >> I am sorry - did not get that. Is the above flag combination some
> >> how wrong ?
> > 
> > It's dup. Please, take your time to find the very similar piece of code in one
> > of the helper functions we have.
> 
> Are you referring to special_hex_number() ?

Bingo!

-- 
With Best Regards,
Andy Shevchenko


