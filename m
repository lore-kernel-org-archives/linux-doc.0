Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ABB1F5834;
	Fri, 24 Jul 2026 05:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784869633; cv=none; b=d4yOuIt2diOOjfXDzFP52dk9ZCxcB2IAdWpz5HhlSXCKu0om6ohaFpTtUqt91+4auRrtm9vdUbmsF966cvHy+wcru3DPbbH5pwwRDPr+2joH4irTLyHqFws4G6FXf6OmP9ygvpFurQJ3LA1SyG4gFHXxKTyhJMR0/b8npJ6mxXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784869633; c=relaxed/simple;
	bh=zvJ3bYrDyxrQWthvO50TBa5Lwaj+jG07PHq5LLzMcyE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ce0Z5kKunkGqxLZe0r73mMxUz400SsDjBUKR3rYd/jz3M5pfr3bf/L+4mWTkok8D4CIYgWqy42rmB8BUZyXt2y9NOx4yHlv2tLlGKzzPyZz5Xsn/VakGvehnl0MrWMKVuocwSqXb5PNHoRzp9PKDXEeqh6UanwGq1x4jmd3Qm2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=ulmSOAbC; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="ulmSOAbC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Sender:Reply-To:Subject:Date:Message-ID:To:
	Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8l5p32HH8Rhuc+WKTCqNYoYfVbfXtn+rOsuQGzkbRx0=; b=ulmSOAbCxMt9PwLfcVhquYosdO
	GYoDihY337aGXxos7h6gvJx3V58ibcGDArCMUuy+RB4QjvjAwRVEvQJiZDWQ7kZ5648V5wjLPjy1O
	XGHlzHcbYnGLLrrKBJnxakdz1cUxya6QswhpHQiJaXFgqJNcKY+oyR+Bx1xKLSlMSQe0+YcUPrXxg
	2ljH1jo2cNI2h4U22FCql5EkjQnSVwyq/Pynxqm0hZyvPqIc1/09364Kk9biv7nETpCwH4KDQmht0
	yy2A5ksVTi1Vr7cdiPLvcrJp2rmg/aPSfU7AgQkWM65QCFk5KJU2MvLPJ99zNJLqA9uLLnlvWX0ky
	9Wbhy6LQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1wn7sl-00ES0x-32;
	Fri, 24 Jul 2026 06:51:35 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 0/2] Documentation: Add my name to the Kernel Statements
Date: Fri, 24 Jul 2026 06:48:37 +0200
Message-Id: <20260724-sign-kernel-statements-v1-0-52131fb5affb@fjasle.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKXuYmoC/yXMyw6CMBBG4Vchs3YSKMYGX8W44PIXBnU0nWJMC
 O9uleW3OGclQxQYnYuVIt5i8tSM6lBQP7U6gmXIJle6U+ldzSaj8g1RcWdLbcIDmoyHugreNy4
 cQ0c5fkUE+fzHl+tuW7oZffrdaNu+aoTywXoAAAA=
X-Change-ID: 20260723-sign-kernel-statements-d31f7792f4fb
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nicolas@fjasle.eu>
X-Mailer: b4 0.16-dev-5acee
X-Developer-Signature: v=1; a=openpgp-sha256; l=795; i=nicolas@fjasle.eu;
 s=20250924; h=from:subject:message-id;
 bh=zvJ3bYrDyxrQWthvO50TBa5Lwaj+jG07PHq5LLzMcyE=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqYu6sbMliWf0eXGGC8LqpURKAXE+vvZy9Ksree
 PhdD++gn52JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCamLurAAKCRAHUgpwFiYS
 aY82EADgMe9qR7Xt5otizibL/onUqf5vRBADrAZv0A0Olesrd72uvdoczLNE2vwZcQAncDcRTal
 ETQFpBs+L7Wog9ftLQ6tcm1NgJTtIzqoxznRzE/vUDl5/5bOZ9vpYYSnvJzudv+iBejdxBXdlCo
 PgD9HuLKxQVuhHd471gyPrDY2xY8opZ18KbyOmxkThdKXPFuGi4wxujV76d8f/Hv/1Izt0DzsSm
 uoTa4YsCAbNsrLphvrfaB/URDtYY7h8rR05A2odvMATAl5hQbWAEqA9+or4O7ZcuFgKRqkEvoSv
 DGZi4YTrRBOR9V1Dfh/wTiH8AXMBIE4eeze4/q0dT+B8kNPfMu1/802jVeoPCMlCc2HLk0GM6dD
 VUh4DByfzAbtiPmvrBz3K7g0OYOO0GXGjYWLFnU9ulD1Bv3TTaiUpC2eF0/Vs8WqZGM+YiPPzCR
 cNwDxejnBaKid6K8ZA9FK3BFWzFZybSxwo9dUIiH8Fj6yOsaZMN4ZZbZWPTPJ024P9/GM/6vW6P
 VUGChx8RXPeMYHBo+KTk0k0ljMPKlRFoa3gKYjeSbwPadtK7nr+iEwrt7j3SV0PxHLiQMsEg0DF
 funUGXZRxbbMWDCBj3kyicAZWoquFTaRsIpC6llFLPD7HMP1RZdTmpZuwn/+wg7in1cBFt2ot1s
 Pi6rlnEzCJObidg==
X-Developer-Key: i=nicolas@fjasle.eu; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

Recently, I stumbled over the Kernel Driver Statement and the
Linux Kernel License Enforcement Statement and wondered why I
never before had seen them.  They express strong convictions,
which I do share and support, in clear words.  I gladly sign
both statements.

Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
---
Nicolas Schier (2):
      Documentation: Add my name to the Kernel Driver Statement
      Documentation: Add my name to the Kernel Enforcement Statement

 Documentation/process/kernel-driver-statement.rst      | 1 +
 Documentation/process/kernel-enforcement-statement.rst | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 77993fa6081492ef990d8ffeb5f2ebc77b096d69
change-id: 20260723-sign-kernel-statements-d31f7792f4fb

Best regards,
--  
Nicolas

