Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039FB1C9ED8
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725630220; cv=none; b=cpKS04QxaEqyqX/ZfOF4QLK0EN7RK8UmTmcpsP9boTfhGg/ItbPte+ADBVQRVGnbk+bHQOT4EtY66icXi1grGlSfdOWTQ0Z/QiRWhLvN7MCRiS+CkTw/dE/61Ijs22+tilcMRvTRcvAEjFHoAXnZftkg4Xg5msIAJiDjgxojHKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725630220; c=relaxed/simple;
	bh=sKuluqnwIsBPMAlp7oejy0CyZ+fiG45THI2vkou9XSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eG++CK5OuTUTW9T+TTwWimdA1cDK+P2rMYOJd7OlsOKF4agCAFd4b3dVjboZrHfhv0AWLm0+K1lXLMILZ6aOoWBWceD66j32OCdEqW+gK6J4sTv3nBgn4oYhxvn7IHcCMJ3LUSN1zb0SlFTFh/hGem+NdpvtxwzWFTAkINEt1lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1ksUwQ1y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pfhRpJEY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1ksUwQ1y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pfhRpJEY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1ksUwQ1y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pfhRpJEY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1ksUwQ1y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pfhRpJEY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 170CC21AC6;
	Fri,  6 Sep 2024 13:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725630217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSIdAw94DvEKiuaIKAWci801YGMaKi5IrT8RbMF4Y2Q=;
	b=1ksUwQ1ysivGC4S27OJCKLMiKhtrUEy+JsfTyn+65N27J1dZEt1CemRLjHFiuVPB1wunTx
	P9qBmnvWaYJgNAMZ6P3bYHKSojkjCFLjDIlty4Yed7CHhm/5z85iRsOMwBVtjET0nvi8ZG
	VjYGp/QmP/mRm3MOWFfbQ5RjUQ1NBII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725630217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSIdAw94DvEKiuaIKAWci801YGMaKi5IrT8RbMF4Y2Q=;
	b=pfhRpJEYfUpiD/N8MAXVvcYaG3aoZjw8kTQhAHJlXO55Ek6R3AOQ9YQAG1T1+VgK0cyBbO
	4dF5rBCctNZSN9Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725630217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSIdAw94DvEKiuaIKAWci801YGMaKi5IrT8RbMF4Y2Q=;
	b=1ksUwQ1ysivGC4S27OJCKLMiKhtrUEy+JsfTyn+65N27J1dZEt1CemRLjHFiuVPB1wunTx
	P9qBmnvWaYJgNAMZ6P3bYHKSojkjCFLjDIlty4Yed7CHhm/5z85iRsOMwBVtjET0nvi8ZG
	VjYGp/QmP/mRm3MOWFfbQ5RjUQ1NBII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725630217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSIdAw94DvEKiuaIKAWci801YGMaKi5IrT8RbMF4Y2Q=;
	b=pfhRpJEYfUpiD/N8MAXVvcYaG3aoZjw8kTQhAHJlXO55Ek6R3AOQ9YQAG1T1+VgK0cyBbO
	4dF5rBCctNZSN9Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF8FC1395F;
	Fri,  6 Sep 2024 13:43:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4szVNAgH22aHKAAAD6G6ig
	(envelope-from <bwiedemann@suse.de>); Fri, 06 Sep 2024 13:43:36 +0000
Message-ID: <b4e30cf2-096f-4fd0-8dd7-8dfef706c958@suse.de>
Date: Fri, 6 Sep 2024 15:43:36 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Build kernel docs deterministically
To: Jonathan Corbet <corbet@lwn.net>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <878qw6qpbu.fsf@intel.com> <18f6aafd-3a96-42fc-9a65-b1b03ab8ae2a@suse.de>
 <87y146p7tp.fsf@intel.com> <87ed5yj7ye.fsf@trenco.lwn.net>
Content-Language: en-US
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
In-Reply-To: <87ed5yj7ye.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4]
X-Spam-Flag: NO
X-Spam-Level: 

On 05/09/2024 20.01, Jonathan Corbet wrote:
> [I wouldn't have minded being CC'd on this conversation...]

Will do next time.

Looking at one of the diffs I got:
https://rb.zq1.de/compare.factory-20240904/diffs/kernel-source-compare.out
whatisRCU.html seems to have a dozen missing lines in one case.
Possibly, because it depends on which other files have already been 
processed at that moment.

Ciao
Bernhard M.
