Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909918;
	b=ASbt+sX/+VyCtc4SI8wRj0JkcTUbOlz9jzRO/AxfDtMcErQz5sRT3YOlglqY7mrj6uAH
	 spzN26MMhddRt9R/F3C2nETc8AF/6fhjncrAtzVwSUmQZddtoYDF3rdVHZOla5NHu/OWw
	 nuPkTHLS8nHPZnO5MoNodLGeTenCakr0Dn9MlW4lP65yE/85iWteJNNNYq7fdEohmfnn5
	 WQtpww2vQkn5DwCFmZtWTsQ2+pI3ZvDJeAgwaPtA+tub/EL63xFARzaaFlNlmTbZh7l2O
	 HTR4kxJiJPrORmF5t/Ziz/rVZl3L3EOOw77KgbOHKkMiKiJ0pVHJt7PL511tIxIeryg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ou4/lAhEpFwwKVnn/O173URP+OPA9Dr5LXSyF2aM0Kk=;
	b=hCbSpwcUHmzI2IGsKZFhrn1/HV5ruo6ft+CkcoaO15fAlyb0wj5VvNeG9dRkWCDWyBdd
	 d/la7JHlH471J5fqB+CQiW1JKy2yWUbG8VXW+TXZbkmAgDQqPnaKzdBAMAjEWULj6pC52
	 rWp7RqqimW2CCIezIILjoVUuDwXTuHivXPRUKnm4xs3aQK3Gm0mDfQeJPdnCTz6VY6gqH
	 ZQ7o/ph7oPOUR6BgwOxVlPCFyFzEkOwttWuNkVRMCGFFlA2faA/NkP2kelKA+fLR5sgYn
	 hQLIVbv1p1oJiZtm2jhMhd2uu1jhSSNf0NGMOrguG0TRSAFDV/uMy77h6RKPWSRRNYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=fY92HljY;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61176606A32F
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 20:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61176606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=fY92HljY
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1239601f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 12:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793909911; x=1794514711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ou4/lAhEpFwwKVnn/O173URP+OPA9Dr5LXSyF2aM0Kk=;
        b=fY92HljYm7SUL/irbYBIukak8YUb3C47lQ24TCLgGG5fynimxwPMQM+lYLIvhRAsPn
         qeUUtYqIRjEY35BnZd3pdA7+2EWRL0YEmPLA5UQch4Pmsy+TjNMBcr3MTzWON96WdVQW
         oL4VhqsBcv52vQnJuepnrDyVRTGTF3q+i9khUTk18gQQlez/vXzTpXcx+azvPnzpGGEt
         Pu6zHj0bebmvcJ6HDvrCNcnCbekezGsG0wMHx9JJ2rRXOwP5gRcGtCiKlDVRkmpycaAD
         uSyxZVf1n0IK3GC0YVK8+h9Ma5JBOF0GGkZPL5elj6Rn5CwQSU1cy/+Q5oCHg3VB1E0a
         fh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909911; x=1794514711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ou4/lAhEpFwwKVnn/O173URP+OPA9Dr5LXSyF2aM0Kk=;
        b=O3mvsq9WPV6Lq6gLh2Q60U4VkiWqT5oWvQhNEEDvRXMHg6WppO0w7xvg/q5OV3lfsP
         /MTtt2RorglZaGHhXG/BIn3C7EnTE2uQydkSvVtS5QqKeoj8iPxst4CKCEUDHP77RVOY
         a7rh2P7L/cfogfTrZCVx69ABz7OBXRn7ht1lt+V4dZHVbAKkZ/NZJ8ceIZq399xgpX1x
         1IarZ3A+Jp2RvGhTktZU8J6hysfCBtpwXRqEOMpEx4sYA+OsHCJFZBDWbg6H4Zb9CgLM
         Xj/DtCNpjHwSQa+bcwwDmDpl2An7hekmrm7ZI85fcL5Sh2D+x5NezR7GjrCBxmEcpgPH
         7ASQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSvT9dGr/ARKoSMxvS8VthCsYrESldBKiUGTPkPU/kuIGMAX9FyM/sHt6a38hIc+xLkHr97MXtZe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GQwKfPrlQGZbwUjM9caZS/UPmyH9s5OfrGEoLdxUKtaEKB+zp
	/vUOau+ibvmFZBOwOCA4vILuiO8z8PmQYDrS1a5lle3u5R4dksHZgVoDxRIihOCJgOo=
X-Gm-Gg: AYBFou0QkfdFanHgG1y/DB/e619hJZX8I6Wyp0boda+GR0GB3PkWt2qsvrOpM1vrqK1
	wij8S9N8sNXahnISutrPzfo93T79XlQJTmeGxhZRUv8oB5dqMqFkHsA1iShyHqU5vCsyt3g2HWd
	Hc8fjahypujm6Q96IcfrdyEI9P6e1Skd3g0+7OfHqsR4EgucsfoKb7DrCqgJH3E4u3uM0COWlve
	fhaJvch24cyrbnG3oUAyLZPfIiswh9myZ0D43F+CR/H6JpzUw+cNeJLn/sjwCXCH6kU8DdwEm7b
	3LS++OCOOICzgCsco493ra8DsjguM+VjcuMV7e8MFyoCIeApfzvLDxYGCt/ec9UlnKnJ/jOPBks
	0IQjFAyUJMFyfhtScInU6vEaRVOsJHJQZrrWjiOV+uEmrNrXoLTGZB28qzBQXPb28VxHaSKjDRP
	pL+jvHRHDXnvtewMlE1ishgmTT6jXW9Y2vZJwOd2H9A4pggyVRvYh0EnojDLG1wXBAdIN45a3Gc
	o2j71OdGfJHbkuKgA+MqjFyzZKDpOPdNEgaNk9qwe6NlnA9UdjW8EY2+xUtTmw3Qp8RO7i7dh7e
	Ef61G4jdkpYnKun9VDY8P+uZPhMbXzEn6KQSZmLOS9qnwZPt
X-Received: by 2002:a05:6000:1788:b0:491:ed89:a38f with SMTP id ffacd0b85a97d-49276977d36mr1397300f8f.23.1793909911128;
        Thu, 05 Nov 2026 12:18:31 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm11653632f8f.21.2026.11.05.12.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:18:30 -0800 (PST)
Date: Thu, 5 Nov 2026 12:18:27 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Haris Iqbal <haris.iqbal@linux.dev>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [v3 for-next 1/3] block: Reject unknown status tags in error
 injection rules
Message-ID: <20261105201827.GB2439-mkhalfella@purestorage.com>
References: <20260928221634.43239-1-haris.iqbal@linux.dev>
 <20260928221634.43239-2-haris.iqbal@linux.dev>
 <20261005084917.GA9160@lst.de>
 <20261020223402.GA1582237-mkhalfella@purestorage.com>
 <58a98f7d-b2c5-47b5-a372-0ab5afa6a8ed@linux.dev>
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
In-Reply-To: <58a98f7d-b2c5-47b5-a372-0ab5afa6a8ed@linux.dev>

On Thu 2026-11-05 21:00:27 +0100, Haris Iqbal wrote:
> 
> 
> On 10/21/26 00:34, Mohamed Khalfella wrote:
> > On Mon 2026-10-05 10:49:17 +0200, Christoph Hellwig wrote:
> >> On Tue, Sep 29, 2026 at 12:16:32AM +0200, Md Haris Iqbal wrote:
> >>> tag_to_blk_status() returns BLK_STS_OK both for the "OK" tag and for a
> >>> tag it does not recognize, so a caller cannot tell the two apart. The
> >>> block error injection code (which is the sole user of this function
> >>> currently) relies on error_inject_add() later to reject adding a rule with
> >>> status=BLK_STS_OK. This is okay for the current state of error injection.
> >>>
> >>> The delay option added in the next commit makes the rule with status=OK
> >>> valid, meaning the function tag_to_blk_status() now needs to explicitly
> >>> match BLK_STS_OK for it, and fail for a tag it does not recognize. Hence
> >>> make tag_to_blk_status() take a second param to update the matched status,
> >>> and return true in case of a successful match. If a match is not found,
> >>> the function tag_to_blk_status() returns false and *status remains
> >>> unchanged.
> >>>
> >>> A repeated status= where an invalid tag comes first is now rejected
> >>> instead of being overridden by the later one.
> >>>
> >>> Cc: Christoph Hellwig <hch@lst.de>
> >>> Assisted-by: Claude:claude-opus-5
> >>> Signed-off-by: Md Haris Iqbal <haris.iqbal@linux.dev>
> >>> ---
> >>>   block/blk-core.c        | 14 ++++++--------
> >>>   block/blk.h             |  2 +-
> >>>   block/error-injection.c |  7 ++++---
> >>>   3 files changed, 11 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/block/blk-core.c b/block/blk-core.c
> >>> index 13dc70e8f55d..c45846b9c50d 100644
> >>> --- a/block/blk-core.c
> >>> +++ b/block/blk-core.c
> >>> @@ -225,21 +225,19 @@ const char *blk_status_to_tag(blk_status_t status)
> >>>   	return blk_errors[idx].tag;
> >>>   }
> >>>   
> >>> -blk_status_t tag_to_blk_status(const char *tag)
> >>> +bool tag_to_blk_status(const char *tag, blk_status_t *status)
> >>>   {
> >>>   	int i;
> >>>   
> >>>   	for (i = 0; i < ARRAY_SIZE(blk_errors); i++) {
> >>>   		if (blk_errors[i].tag &&
> >>> -		    !strcmp(blk_errors[i].tag, tag))
> >>> -			return (__force blk_status_t)i;
> >>> +		    !strcmp(blk_errors[i].tag, tag)) {
> >>> +			*status = (__force blk_status_t)i;
> >>> +			return true;
> >>> +		}
> >>>   	}
> >>>   
> >>> -	/*
> >>> -	 * Return BLK_STS_OK for mismatches as this function is intended to
> >>> -	 * parse error status values.
> >>> -	 */
> >>> -	return BLK_STS_OK;
> >>> +	return false;
> >>>   }
> >>>   
> >>>   /**
> >>> diff --git a/block/blk.h b/block/blk.h
> >>> index 2cc03aa54c53..5fa54162c686 100644
> >>> --- a/block/blk.h
> >>> +++ b/block/blk.h
> >>> @@ -52,7 +52,7 @@ void blk_free_flush_queue(struct blk_flush_queue *q);
> >>>   
> >>>   const char *blk_status_to_str(blk_status_t status);
> >>>   const char *blk_status_to_tag(blk_status_t status);
> >>> -blk_status_t tag_to_blk_status(const char *tag);
> >>> +bool tag_to_blk_status(const char *tag, blk_status_t *status);
> >>>   enum req_op str_to_blk_op(const char *op);
> >>>   
> >>>   bool __blk_mq_unfreeze_queue(struct request_queue *q, bool force_atomic);
> >>> diff --git a/block/error-injection.c b/block/error-injection.c
> >>> index e14bc4b723ef..db543fe27630 100644
> >>> --- a/block/error-injection.c
> >>> +++ b/block/error-injection.c
> >>> @@ -171,15 +171,16 @@ static int match_op(substring_t *args, enum req_op *op)
> >>>   static int match_status(substring_t *args, blk_status_t *status)
> >>>   {
> >>>   	const char *tag;
> >>> +	bool found;
> >>>   
> >>>   	tag = match_strdup(args);
> >>>   	if (!tag)
> >>>   		return -ENOMEM;
> >>> -	*status = tag_to_blk_status(tag);
> >>> -	if (!*status)
> >>> +	found = tag_to_blk_status(tag, status);
> >>> +	if (!found)
> >>>   		pr_warn("invalid status '%s'\n", tag);
> >>>   	kfree(tag);
> >>> -	return 0;
> >>> +	return found ? 0 : -EINVAL;
> >>
> >> 	if (!found) {
> >>    		pr_warn("invalid status '%s'\n", tag);
> >> 		return -EINVAL;
> >> 	}
> >> 	return 0;
> 
> As Mohamed mentioned below, "tag" would leak then.
> 
> > 
> > Doing it this way will result in use-after-free. "tag" has already been
> > freed above.
> > 
> > Maybe change tag_to_blk_status() to return an int (0 on success and
> > -EINVAL on failure) and use its return value without mapping it?
> 
> I am not sure I get your suggestion completely. Even if we change the 
> return type of tag_to_blk_status(), we would have to free the "tag" 
> before returning.

Changing tag_to_blk_status() to return an int will not have an effect or
"tag" like you mentioned. But you will not need to map the return from
that function.

return found ? 0 : -EINVAL;

The line above just returns what tag_to_blk_status() returned.

> 
> What can make it simpler is allocating "tag" on stack, and then use 
> match_strlcpy() instead of match_strdup().

That can work too. Just make sure we limit the string size somehow.
