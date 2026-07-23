Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20F8352C28
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784818780; cv=none; b=XN4MqeiRN0hDZCuz3Z59B50Gp3JyIBnM+TL6zQRrt0FTLFYKoXu6XWcrhtA0KWcrS1+fqk7webTs9NqMQX9rlfxpxX+7GbZdd+OETy1jQXB+MMiJT99RQSAFbLeQoj4ygjY2iuAktBiP6iBU3DxQ8Ga03LJus2rlsimLXrP1+cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784818780; c=relaxed/simple;
	bh=mnkxGGlYQUmqxiZ5F6HMSpvxdb3XiuB8v2ZxO6IVV68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3PB7dj6gT+ejTDkH3GLMXhwyh/wMhHiHgsCPtM1XZ/KLX/3VYVdaCtYvuSNe4OwguHGt/nQJIDWnwBW8BSHSSWkgKbgkYfQjEn1amsfqTzMhOx1K5bf9a+w8SGbK7mSl9j8pzrki3MuAxnHQk6q0sRZmUAzChTUf+bh1/j7U4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=NI4LDzym; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="NI4LDzym"
Date: Thu, 23 Jul 2026 22:59:00 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784818776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mnkxGGlYQUmqxiZ5F6HMSpvxdb3XiuB8v2ZxO6IVV68=;
	b=NI4LDzymaqPQecVr+jPq9VuLsj/kE0BkFtTOVJFvunRQJmT8919tytXe39IIFf0npKJFES
	DEI8H3XMTkjodsB9es/14k192T0AmSJ300mEhjOHxv7cpnuAxMnYcpI+ivuppaQOo8jvYV
	entOgkLUOxBiSXTA+ymobIi8fenl7sJ7XIlzIYrjvmo7pj5W3WSw2kSRQrjixW8OEEjycu
	ySswooGMDxeqRDKYiShJa90PdezyKXpiESt1zA5DbCDFKhqACoS5seXgsiiKalLqfMUw3a
	P8G4697RTscVaQGNZVKap04V8aZmDMmIRXP+zk2PtVFNifIPzbXkNp+I3PXNaA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: dayodayo <dayodayo1410@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3]docs: ja_JP: Add 1.Intro.rst Japanese Ver
Message-ID: <amIsNEmP_1A5wzxg@wyuan.org>
References: <CAKJLdqb=dqSJ56FSRL2eBJWdtuknjkmDo=+et_BZOmbWUHuKJA@mail.gmail.com>
 <113d2aa0-a4b3-4bda-81ba-9d23cc237d0a@gmail.com>
 <5f24dbf4-d98a-4ab9-8dcf-dcadcf9307cd@gmail.com>
 <c1006587-c2f6-4ae0-948f-217bb0ff3509@gmail.com>
 <ad9f3670-2626-4af4-964d-a2e7de29719c@gmail.com>
 <amIl1WEw9uHOMlc_@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amIl1WEw9uHOMlc_@wyuan.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Jul 23, 2026 at 10:31:56PM +0800, Weijie Yuan wrote:
> For the patch itself, while I can't read Japanese, the convention should
> be to start a new line every 40 columns on each row (please request the
> maintainer to specify the exact requirements for Japanese)

Sorry, I mean every 40 Chinese or Japanese characters here.

Thanks.
