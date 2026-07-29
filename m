Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605E93AAF6C;
	Wed, 29 Jul 2026 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343557; cv=none; b=aeJsioEp0in+xF/4U2tFklf7SToHcuHeUjeCitQGsivqZz9uIfpFTIegmO2YVdblRsp2051riPsQwp1y4Ar+MKKk3/uL+PCk0kRd/w3TR2lwmvMFWCseGLfuS+yyrvSHuXt2Vo2xVpzbLLANmKi6tn03T5FQJk3nep9BiyrNSYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343557; c=relaxed/simple;
	bh=auTljfJu2l6j/N7HyQT/1OOcrGYZrKtuxxlSS6NrtFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fe14HdAUukiZuE0z0DRZT7LPtObC4tEYs3cEdqDhXpO7vLqvPoU6O5TB5FnFA9BIrmBigSRx4mkNpTkVjdPBDcmF7CouZdiQFUIVQpVmiX+zngrt4pANmiwYsp2sSdyjlYPGKOamgG0P3UcajChLjDW8bW0dp0oDPtLsNSKxMmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=qn7Ev1Ev; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="qn7Ev1Ev"
Date: Thu, 30 Jul 2026 00:45:25 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785343549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Cn/8K45+J2DMOw/SgRQIztkOeT8wFXAsFl0AGyVhN8=;
	b=qn7Ev1EvB+dwsUYxhP8oRj0zSOcc2V0vDdGT2oY+0eH4Rtb4y1HzZT0YRGMasvh+D6d8P0
	IqguLir2yGHercSJArVF1kKHJ78Es257f4x1fRap1BRDyaJ9AKz3UVOeYZ3Up7wy1aJQqn
	p1E/W3nGfOjag0zw1Jr2X51bMl8CGOhBTjdyglTyto4vHX+hx0J643Yp3AImMUcvtPZmYJ
	WUNe8ItxXycU3IK4XvAugdZciCt4hBbGMihNfK+C68cIM41roFHwHTQNqVDhayzrGlWyoZ
	OtOHdd5RstqmM/6AYFw9RPW3ioc9GLqsNFUwZVWnN13dSXM1wJuSiqBvPGR9qA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/16] docs/zh_TW: process: localize terminology in
 code-of-conduct-interpretation.rst
Message-ID: <amouJSTjAMh-pK6S@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-4-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728091038.171033-4-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 28, 2026 at 05:10:25PM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 社區→社群,
> 軟件→軟體, ...) and sync with the English original: rewrite the
> enforcement section to match the current committee/TAB wording and add
> the "Enforcement for Unacceptable Behavior" section introduced by
> commit c818d5c64c9a ("Documentation/CoC: spell out enforcement for
> unacceptable behaviors").
> 
> update to commit 04c4bb90ae6e ("Documentation/CoC: Spell out the TAB
> role in enforcement decisions")

If the following comments are due to my overthinking, then

Acked-by: Weijie Yuan <wy@wyuan.org>

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../code-of-conduct-interpretation.rst        | 162 ++++++++++++------
>  1 file changed, 113 insertions(+), 49 deletions(-)

I didn't take a closer look about the new part below, so let me do it
this time.

> +不可接受行為之行為準則違規的執法
> +--------------------------------
> +
> +行為準則委員會致力於確保我們的社群持續具有包容性，促進多元的討論和觀點，並
> +致力於隨著時間改進這些特質。行為準則委員會收到的大多數報告，源於對開發過程
> +以及維護者的角色、責任及其對程式碼接受與否的決定權的錯誤理解。這些報告透過
> +澄清開發過程和行為準則的範圍來解決。
> +
> +不可接受的行為可能在短時間內中斷相互尊重的協作，並對社群的健康造成長期的
> +負面影響。當個人在違規發生的場合承認自己的行為並作出彌補時，不可接受的行為
> +通常就能得到解決。

In zh_CN, I think we prefer '纠正' (纠正行为). Just a reference. I'm
fine with it if there are indeed different practices on both sides of
the strait regarding this matter.

> +當不可接受的行為未能透過社群討論解決時，行為準則委員會會收到相關報告。當
> +不可接受的行為對相互尊重的協作關係造成負面影響時，行為準則委員會會採取措施
> +恢復有成效且相互尊重的協作。
> +
> +行為準則委員會有義務對報告和報告者的資訊保密。報告可能來自受害方，也可能
> +來自目睹不可接受行為的社群成員。行為準則委員會有責任與所有相關方合作，調查
> +並解決這些報告。

处理报告 or 解决报告？I don't know Taiwan's preference.

I would do this in zh_CN:

行为准则委员会有责任与所有相关方合作，对这类报告进行调查并予以处理。

just a reference.

> +行為準則委員會與當事人合作，促使其理解以下事項的重要性：修復其行為對受害方
> +造成的傷害，以及對社群的長期負面影響。
> +
> +目標是達成所有各方都能接受的解決方案。如果與當事人的合作未能達到預期的結果，
> +行為準則委員會將評估其他措施，例如要求公開道歉以修復傷害。
> +
> +要求為違規行為公開道歉
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +行為準則委員會在違規發生的場合公開指出該行為，要求為違規行為公開道歉。
> +
> +為違規行為公開道歉是重建信任的第一步。信任對於一個以信任和尊重運作的社群的
> +持續成功和健康至關重要。
> +
> +若未為違規行為公開道歉的補救措施
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +行為準則委員會透過向TAB建議補救措施以供批准，決定恢復健康協作的下一步行動。
> +
> +- 禁止違規者參與核心開發過程，期限最長可達一個完整的核心開發週期。行為準則
> +  委員會可以要求公開道歉作為解除禁令的條件。
> +
> +一段時間內禁令的範圍可能包括：
> +
> +    a. 拒絕其補丁貢獻和拉取請求
> +    b. 透過忽略其貢獻和/或封鎖其電子郵件帳戶，暫停與違規者的協作
> +    c. 限制其透過kernel.org平臺（如郵件列表和社交媒體網站）進行交流的能力
> +
> +一旦TAB以參與表決成員的三分之二多數批准了禁令範圍中列出的一項或多項措施，
> +行為準則委員會將與社群、維護人員、子維護人員和kernel.org管理員合作，執行
> +TAB批准的措施。任何同時在TAB任職的行為準則委員會成員不參與對這些措施的表決。
> +
> +行為準則委員會深知要求公開道歉和實施禁令可能對個人造成的負面影響。它也深知
> +在發生此類嚴重的公開違規行為時不採取行動可能對社群造成的長期傷害。
> +
> +TAB批准的補救措施的有效性，取決於社群、維護人員、子維護人員和kernel.org
> +管理員在執行這些措施時的信任與合作。
> +
> +行為準則委員會衷心希望，需要要求公開道歉的不可接受行為，在未來仍然極為罕見。

行为准则委员会衷心希望，那些需要公开道歉的不可接受行为在未来能继续成为极为罕见的现象。

.. seems more clear and coherent?
