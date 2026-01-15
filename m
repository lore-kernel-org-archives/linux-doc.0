Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321FA3A1E77;
	Thu, 15 Jan 2026 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768495062; cv=none; b=Jpr53w2a2EmwlMjHwcUS7mVcbcXHfp16SNAAXFfeFg76GWL2t7MGrMpJf9pSrdUOjhv34vh7ONM2TmoJLfefpfuUAuYlP0iOnxDaKl1PRsMRhv+CnRB723oukZzAwi4WzYT8ytLZCrMkiZO1YE9AdLqznQ8eK++FGGsVHjG6n80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768495062; c=relaxed/simple;
	bh=bK28d0TrRA7h5Ji2D5wHJPaMUtZ7e6nDUEBKgflusOA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CJ/cadsB2zeG0PMxp64SKoIx3hmhKYxvnOjJkmffyZtQU5AFOKPt49hAKv+ID9oI+nFSr1XuH+WP43LZbtifmyveiITwlim8i7ox+N1WZ3U3H1WHDbxD2lMCas6Zb5WINKr1CUt4fbTySynHxQbH2jFnwRsxdObl90pdHlO32P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=tctXJJpT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="tctXJJpT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8033EC19421;
	Thu, 15 Jan 2026 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768495061;
	bh=bK28d0TrRA7h5Ji2D5wHJPaMUtZ7e6nDUEBKgflusOA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tctXJJpTOwdwO9YY6jRqyMr9TVxNeUlXF88OdmeNBwscVl6/sXtPjONPdOGKZag8g
	 yoH7sNlk957NVHeCoDnHQnToq2WglHM6eVjRylltNSpPKoMUgFHoayczSCmLJcLqgk
	 Dl0eVE1X//JWWYbfMwQwUh+muY+OoGoqkv96W/hY=
Date: Thu, 15 Jan 2026 08:37:39 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH v2] delayacct: add timestamp of delay max
Message-Id: <20260115083739.7b2e8af2bef09f17be217366@linux-foundation.org>
In-Reply-To: <20260115235237033LzsFFFvq_z_7YAubzLW8T@zte.com.cn>
References: <20260115235237033LzsFFFvq_z_7YAubzLW8T@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Jan 2026 23:52:37 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> Problem
> =======
> Commit 658eb5ab916d ("delayacct: add delay max to record delay peak")
> introduced the delay max for getdelays, which records abnormal latency
> peaks and helps us understand the magnitude of such delays. However,
> the peak latency value alone is insufficient for effective root cause
> analysis. Without the precise timestamp of when the peak occurred, we
> still lack the critical context needed to correlate it with other
> system events.
> 
> Solution
> ========
> To address this, we need to additionally record a precise timestamp
> when the maximum latency occurs. By correlating this timestamp with
> system logs and monitoring metrics, we can identify processes with
> abnormal resource usage at the same moment, which can help us to
> pinpoint root causes.

Seems sensible, thanks.

> Use Case
> ========
> bash-4.4# ./getdelays -d -t 227
> print delayacct stats ON
> TGID    227
> 
> 
> CPU         count     real total  virtual total    delay total  delay average      delay max      delay min      delay max timestamp
>                46      188000000      192348334        4098012          0.089ms     0.429260ms     0.051205ms    2026-01-15 15:06:58

"2026-01-15 15:06:58" isn't very friendly to parsers?  And because it
has a space it's two columns whereas everything else in here is a
single column.  Perhaps there's some more parser-friendly way of
presenting this?

>
> ...
>
> @@ -217,7 +223,8 @@ void __delayacct_freepages_end(void)
>  		      &current->delays->freepages_delay,
>  		      &current->delays->freepages_count,
>  		      &current->delays->freepages_delay_max,
> -		      &current->delays->freepages_delay_min);
> +		      &current->delays->freepages_delay_min,
> +			  &current->delays->freepages_delay_max_ts);
>  }

The whitespacing is inconsistent here.

>  void __delayacct_thrashing_start(bool *in_thrashing)
> @@ -241,7 +248,8 @@ void __delayacct_thrashing_end(bool *in_thrashing)
>  		      &current->delays->thrashing_delay,
>  		      &current->delays->thrashing_count,
>  		      &current->delays->thrashing_delay_max,
> -		      &current->delays->thrashing_delay_min);
> +		      &current->delays->thrashing_delay_min,
> +			  &current->delays->thrashing_delay_max_ts);
>  }

Many more instances of this.


