Received: from us-smtp-delivery-172.mimecast.com (us-smtp-delivery-172.mimecast.com [170.10.129.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F69439023F
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 20:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772484810; cv=none; b=dItvmsc5YBSJ3WQgy0c+beNOLhrWYmdS8zKgYsSoM2nM92vjlcpNOqEoovQhCkuff/unSLAHe6Up6A8obyXTObRPhgTAK0BdVEUkha2rNJVo/8KXCSrwyXo0nyJ1wx/fFCh2eGrzSDpPQy5TXeXBXONZKjuFuMn2/+a9tkK6QL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772484810; c=relaxed/simple;
	bh=16uxkWL5hX4j7KosRvOHcNcAEDOs7nmqZeye1nOhNDg=;
	h=Date:Message-ID:CC:Subject:From:To:MIME-Version:References:
	 In-Reply-To:Content-Type; b=Hsh9CO72kpCPuF2T8IIXTbNLN8OAKK8UeSoYAxd8iC04+Dyft/2NyuHR8J5RUYE3kDmoqTYjsVhUY01EK6vQWs5SU4IMUs20FK/R8CKLp7j9pyAo1zE2h8vrZdnk7c5rJY+FYe7+9sTRzCGxM34IvdwlPRkQWO8KZX8mdKGROoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=valvesoftware.com; spf=pass smtp.mailfrom=valvesoftware.com; dkim=pass (1024-bit key) header.d=valvesoftware.com header.i=@valvesoftware.com header.b=Dbi5LEw4; arc=none smtp.client-ip=170.10.129.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=valvesoftware.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valvesoftware.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valvesoftware.com header.i=@valvesoftware.com header.b="Dbi5LEw4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valvesoftware.com;
	s=mc20150811; t=1772484806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=16uxkWL5hX4j7KosRvOHcNcAEDOs7nmqZeye1nOhNDg=;
	b=Dbi5LEw4en0dZ9luuvKYVAVeFC85iku3CAkI8zZ8HJ5+tOM/jOQxGhkh6tTXUO3ILHfE+A
	nipqibx+NQhyRBN1F2UqIgGvX8Yq/UT5dZbgoy8Bxdo453pjNp3BxVQMyqhPYq/6MGCyyb
	g7xFgU+khNsZowXgdrhAsOEDgPx7Glc=
Received: from smtp-02-tuk3.valvesoftware.com
 (smtp-02-blv1.valvesoftware.com [208.64.203.182]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-637-5KoDUlM7NYexLNzraLPZVA-1; Mon, 02 Mar 2026 15:53:23 -0500
X-MC-Unique: 5KoDUlM7NYexLNzraLPZVA-1
X-Mimecast-MFC-AGG-ID: 5KoDUlM7NYexLNzraLPZVA_1772484802
Received: from antispam.valve.org ([172.16.1.107])
	by smtp-02-tuk3.valvesoftware.com with esmtp (Exim 4.97)
	(envelope-from <arunr@valvesoftware.com>)
	id 1vxAGX-00000002kig-3oVT;
	Mon, 02 Mar 2026 12:53:21 -0800
Received: from antispam.valve.org (127.0.0.1) id hknsc20171sr; Mon, 2 Mar 2026 12:53:21 -0800 (envelope-from <arunr@valvesoftware.com>)
Received: from mail2.valvemail.org ([172.16.144.23])
	by antispam.valve.org ([172.16.1.107]) (SonicWall 10.0.15.7233)
	with ESMTP id o202603022053210081302-5; Mon, 02 Mar 2026 12:53:21 -0800
Received: from localhost (172.18.17.18) by mail2.valvemail.org (172.16.144.23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Mar
 2026 12:53:21 -0800
Date: Mon, 2 Mar 2026 12:53:21 -0800
Message-ID: <DGSLF8NH5JAV.59WNEOEXYHV@valvesoftware.com>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, Arun Raghavan
	<arunr@valvesoftware.com>, <linux-sound@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Icenowy Zheng"
	<uwu@icenowy.me>, <stable@vger.kernel.org>
Subject: Re: [External Mail] [PATCH v2 1/8] Revert "ALSA: usb: Increase
 volume range that triggers a warning"
From: Arun Raghavan <arunr@valvesoftware.com>
To: Rong Zhang <i@rong.moe>, Jaroslav Kysela <perex@perex.cz>, "Takashi Iwai"
	<tiwai@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: aerc 0.21.0
References: <20260302185900.427415-1-i@rong.moe>
 <20260302185900.427415-2-i@rong.moe>
In-Reply-To: <20260302185900.427415-2-i@rong.moe>
X-ClientProxiedBy: mail2.valvemail.org (172.16.144.23) To mail2.valvemail.org
 (172.16.144.23)
X-Mlf-DSE-Version: 6871
X-Mlf-Rules-Version: s20260226225627; ds20230628172248;
	di20260302185333; ri20160318003319; fs20260302184959
X-Mlf-Smartnet-Version: 20210917223710
X-Mlf-Envelope-From: arunr@valvesoftware.com
X-Mlf-Version: 10.0.15.7233
X-Mlf-License: BSV_C_AP_T_R
X-Mlf-UniqueId: o202603022053210081302
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T_GRwyZ9pwajabO7TYoNpZlJUAmheccJD53GtsJkxZI_1772484802
X-Mimecast-Originator: valvesoftware.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon Mar 2, 2026 at 10:58 AM PST, Rong Zhang wrote:
> UAC uses 2 bytes to store volume values, so the maximum volume range is
> 0xFFFF (65535, val =3D -32768/32767/1).
>
> The reverted commit bumpped the range of triggering the warning to >
> 65535, effectively making the range check a no-op. It didn't fix
> anything but covered any potential problems and deviated from the
> original intention of the range check.
>
> This reverts commit 6b971191fcfc9e3c2c0143eea22534f1f48dbb62.
>
> Fixes: 6b971191fcfc ("ALSA: usb: Increase volume range that triggers a wa=
rning")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rong Zhang <i@rong.moe>

Thanks for catching and fixing this.

Acked-by: Arun Raghavan <arunr@valvesoftware.com>

