Received: from ns1.suksangroup.com (ns1.suksangroup.com [103.13.31.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96313264C1
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 05:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.13.31.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006665; cv=none; b=tZ111ecwqg4J2QB++7LA85BLt616K5fFERy2hPlN2whTtbgzQGUAl5mYvZbiRFGwyiSfWsQ4+H0aNrvxue4epKWwx4jgTaqzbVv+10DOOmNpL5i9AAWFGsS/UCeQGw3XAuL6NP8HFGDD0jsd6VGZ/7HVixbfboCZeZDC5FIqmVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006665; c=relaxed/simple;
	bh=50htdNoK+zWbWJGeWWdQTw8t2T4Cnvevjw4NK/nxzvI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jq8rMIlaCqvbQECPQ5k+nmTotBSCjSChjf7EiRjQhi/5H3LWDXkuJ7t3y9vhbntQxNO6KNpxTmA246hBYtX/FQAhhDAvC5WLQfYZrCw8Lbdj8pQl9B/P2qK7pnzy/MbztM1oSMSUECd0vO6RZ7hycFIkPUU/JWS5vrsL9qz+zRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org; spf=fail smtp.mailfrom=inbox.org; dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b=WOaJXYAB; arc=none smtp.client-ip=103.13.31.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b="WOaJXYAB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=suksangroup.co.th; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=50htdNoK+zWbWJGeWWdQTw8t2T4Cnvevjw4NK/nxzvI=; b=WOaJXYABUY2vTCNlcfY+Ldrxw3
	e2QxB8P3XkiNI26noJZzBhhPfqMHVHt7KkPrytURnCjVMSNviglMdgEFJ+BwO7C1YGtnfmsM4MWzs
	6+eI6bXalR3qdXlhaY4Q2FvBAwwCNWRRPYV+yjSXMr7t2pTmlEIn9DkxGUHDFO8LZwWh+q7TOgK8u
	LjmXs4SuJPtedpx4DJQFiQjBqlX9/d4vagtMYX3NyflT/su0RGP22EaFiD/7bKz8ID5+r7TjnkaGH
	8yT2DOC4dpDgjNU03qC6rs7JrNqKV/Jk6X8yCm+xAWxh0AprxTw/fUb+gMR/pK5q05m+K4ENmpZby
	HyMt+Ubw==;
Received: from [207.189.26.187] (port=63263)
	by ns1.suksangroup.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <info@inbox.org>)
	id 1wjVd0-0000000Fx9o-2KbV
	for linux-doc@vger.kernel.org;
	Tue, 14 Jul 2026 12:24:21 +0700
Reply-To: hanns.schofield@lexcapitalgrowth.com
From: Harry Schofield ESQ <info@inbox.org>
To: linux-doc@vger.kernel.org
Subject: Dear linux-doc, project info
Date: 14 Jul 2026 00:24:18 -0500
Message-ID: <20260714002417.34A6B0924C178719@inbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.suksangroup.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - inbox.org
X-Get-Message-Sender-Via: ns1.suksangroup.com: authenticated_id: smtp@suksangroup.co.th
X-Authenticated-Sender: ns1.suksangroup.com: smtp@suksangroup.co.th
X-Source: 
X-Source-Args: 
X-Source-Dir: 


Re:Good day linux-doc,

Please let me know if this is best email to send you the project=20
info.

Kind regards,

Harry Schofield, ceMBA


