Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5543A258CCC
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541703; cv=pass; b=Dn8dScZg3stKG2ETb588/yZ9ub9uuGUOlyPRKtHupQviS9oJsjozW4s8+GX7uqYmRiDJh2baNlMRKEUpy13ztbXqWXacgQZTuIz4JwgVHhCJcxNkOdvnpvj3tgAbW6koD+NcqXDq6uHYYzccOZhUCQFGTnUWLdzAJTA8knuEz48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541703; c=relaxed/simple;
	bh=291n1wiiqMVs+hwkbmIIFLP3e1O56zC2O7D2YS7WjfQ=;
	h=MIME-Version:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=hZ1JMzPu/1jG8A2kdc3PU9GrwlPZExlQDmiB0wGjdcU4sFu8vdYGHDVc0V/B6hcdhH0gIM34Tku7qEUv9vdl3G2L30jY96PIA6K2Q58fTIoeN+bBedaFCiPTwNIWYCfv/5Cg1KBKUY5n39gUBYLilla1Faq0bL+GszGsaMyR4Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=kgTaeb8/; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="kgTaeb8/"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 1081810A0ECFC;
	Thu, 16 Oct 2025 00:21:37 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMzaNxTrlC3g; Thu, 16 Oct 2025 00:21:33 +0900 (JST)
Received: from webmail.redadmin.org (redadmin.org [192.168.11.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: weibu@redadmin.org)
	by www.redadmin.org (Postfix) with ESMTPSA id 75BC5109D6CBF;
	Thu, 16 Oct 2025 00:21:33 +0900 (JST)
DMARC-Filter: OpenDMARC Filter v1.4.2 www.redadmin.org 75BC5109D6CBF
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1760541693;
	cv=none; b=FqlYPexZ5WIACc4T6Z/mE486adheQS5uVSDgFTgt06FiqHc2OZd8pL+OeKdTPfcyFLAAmhc1LiWZu9k+M9Oa8Aw7F4fT3GdRBy9Ararh2MYDI/8CHK8qWoR2gr+UsPsN5zAlJpFGMw3QwGmELtyo1+nVkKpot02blYC8+huUFIE=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1760541693; c=relaxed/relaxed;
	bh=3KeFzSS3ZuU1tkBM5f8xY5oVF4dkukXkmiIOXkjVqCQ=;
	h=DKIM-Filter:DKIM-Signature:MIME-Version:Date:From:To:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding; b=BC5ABRwZuUmfHqdMW3OQczyECaud3xfLMjygwv0t6HOV2PXicJJYMTr0Ko1jw4gRAUzJaadgPfEG3eYFIJTS7u0vGpbhfI2FVANykTPGiCzFkMLIswXKJO9zBbf009NsSrM6Dv0WkgVo3KHmfWmaJy+UV/PZ10XG2n1A1EP92uc=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 75BC5109D6CBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1760541693;
	bh=3KeFzSS3ZuU1tkBM5f8xY5oVF4dkukXkmiIOXkjVqCQ=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=kgTaeb8/HtxBUXXv0748qNx2C+0JQK0lt0pMwekcDhiGV7jSPMxOrnyQDHMyCEew9
	 mS0ODjWl9riZcaESyvRsbNE8Yw3FQmbQNBMnYxhehGztL6iCe6K6+bN93JcQEKxWmC
	 2i+QyueO0myshVT33Py05hv9zNP8HPl319RXvPsc=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 16 Oct 2025 00:21:33 +0900
From: weibu@redadmin.org
To: linux-doc@vger.kernel.org, orbet@lwn.net, rdunlap@infradead.org
Subject: Re: [PATCH] Documentation: admin-guide: Correct spelling of
 "userspace"
In-Reply-To: <1760540376-6149-mlmmj-2f9fba2d@vger.kernel.org>
References: <1760540376-6149-mlmmj-2f9fba2d@vger.kernel.org>
Message-ID: <01e4150998aa10bc488e4e5e60dfce1d@redadmin.org>
X-Sender: weibu@redadmin.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Thanks. This patch was only to fix the overt typo "userpace"; no 
treewide wording change intended.
If there is a preferred style for future docs ("userspace" vs "user 
space" vs "user-space"), I'm happy to follow it.

2025-10-15 23:59 に linux-doc+owner@vger.kernel.org さんは書きました:
> Greetings!
> 
> This is the mlmmj program managing the <linux-doc@vger.kernel.org> 
> mailing
> list.
> 
> The message from <weibu@redadmin.org> with subject "Re: [PATCH]
> Documentation: admin-guide: Correct spelling of "userspace"" was unable 
> to
> be delivered to the list because the list address was not found in 
> either
> the To: or CC: header.
> 
> (The denied message is below.)
