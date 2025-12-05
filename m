Received: from 5.mo561.mail-out.ovh.net (5.mo561.mail-out.ovh.net [87.98.178.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A45021D3E4
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 11:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.178.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933401; cv=none; b=OKYn4D6LHYry/5BS2rP9y66ahkhdlSVv35zpNZEBR/AZp/lely0fJVMd0FvLF6TaYpfu8l/q9YqCsTyOqcZwTurVFHX3uuzqzM9T1xfbJ1KEAh4xE4wAvUpFjDzG3n/10hXqhQsLOrNjl2hefDIrmLpnGBKjbK36ntXF0Fd35rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933401; c=relaxed/simple;
	bh=0y8gWCwvAYPTEPR4GrcXZMsdKqyzuZXHH/UlG6ZhIrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IrvBFKF045BQB8lNRIJb1eRqFaSbohPJxbKzs64SQt9pecDOEZSEkYn3eSSaOHbypCP+V/dLG1nVyybPv4dHmZQgpiw8GS/8/tB/eOeGtDiKn/qPFBoqMnIBIoxr6+zLWoiEir36q59i7P7fTviKXDVoqFjjWtBYSfc/cWg50BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=87.98.178.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director2.ghost.mail-out.ovh.net (unknown [10.110.54.110])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4dN82p3w0Dz6TT8
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 11:16:34 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-6f9hm (unknown [10.110.188.17])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 21E0BC0D34;
	Fri,  5 Dec 2025 11:16:32 +0000 (UTC)
Received: from etezian.org ([37.59.142.99])
	by ghost-submission-7d8d68f679-6f9hm with ESMTPSA
	id GEvuNA+/MmmXPwIAHLfwXQ
	(envelope-from <andi@etezian.org>); Fri, 05 Dec 2025 11:16:32 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G003bce61c53-f9df-4629-80d3-adfd3cc59745,
                    EAC13B2666E74075D157C5892600FBB33BFAB6DD) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.82.31.9
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Federico Vaga <federico.vaga@vaga.pv.it>
Subject: [PATCH] Doc:it_IT: Do not reference kernel.h anymore
Date: Fri,  5 Dec 2025 12:15:58 +0100
Message-ID: <20251205111559.3089219-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13768067014224841408
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEVBo8C+zzwPdQYtiZ3wOFzgvVBxGF3yZ/8BCpHBYtF7wW9/RqMHlrsA380ZmfDG/RwmAZihHLHYETwFhrAuGS+8k7KPts06DMV6Aq5Cc+d7J6DXcEWJS9k3/rkcXN0f7tP07IVc2T/PbKedlzcaCI3SIwpFSo1sUt7otcTdF5g/yMpzcytZQ4zLh6ypyNkuyc3w7/UasPD11pjBEp3YYJba+alfjPmzCU99PHfCmOXQ3frw0AWXXT6jx6fjW7z387z8ZS+llGzK3QqoTAcXhsw1Ce6QCTHZ9jxCQVtkJ4D7ryDWrldVHgcaTv6GvIKM2G2nFNObe2WE33U3lfKwX6+hz+fcFFG7lvbyc4kC1YQo0ht5Eqe/9Mz3iR3eMTYMxAP1WhE3yjvIXan3LEDUn4U0j8HddFGzuzf52Oscoi1iW0Ndd3SspHJU5SqYeQi4xwGKGq24s6PCSwJsh926PldMr0XajGmI4/1s37j1Kw4EKJ2MycWAJrSsU5SFDDrH5PNlpL+HB+slqiRitQaPCgvLxhLLYOF4q04tJa/lVU+/J6PXTJQAWGmsd5ig9tqfuJnbIkwKYcCviFbthoaeALCSIIwMbTUm8NCMv6axYOP/a/6QeUrS2/fsOwiV1vje3DB1+DFxQVLeuEsoWQGDMkR5PmDyjUYKYwOTramP+UOnw

coding-style.rst still references the kernel.h header, which is
being phased out. Remove that reference and point to the proper
headers for the examples instead: array_size.h, stddef.h and
minmax.h.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>
---
Hi,

Following Andy's suggestion, and as a native Italian speaker,
I am updating the Italian translation of coding-style.rst based
on his original change.

I also took the chance to improve the phrasing in a few places.

Andi

 .../it_IT/process/coding-style.rst            | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/it_IT/process/coding-style.rst b/Documentation/translations/it_IT/process/coding-style.rst
index c0dc786b8474..b2fd74528de5 100644
--- a/Documentation/translations/it_IT/process/coding-style.rst
+++ b/Documentation/translations/it_IT/process/coding-style.rst
@@ -1068,15 +1068,17 @@ può migliorare la leggibilità.
 18) Non reinventate le macro del kernel
 ---------------------------------------
 
-Il file di intestazione include/linux/kernel.h contiene un certo numero
-di macro che dovreste usare piuttosto che implementarne una qualche variante.
-Per esempio, se dovete calcolare la lunghezza di un vettore, sfruttate la
-macro:
+I file header presenti in include/linux mettono a disposizione numerose macro
+che è preferibile utilizzare, evitando di sviluppare implementazioni
+alternative. Per esempio, se dovete calcolare la lunghezza di un vettore,
+sfruttate la macro:
 
 .. code-block:: c
 
 	#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 
+definita in array_size.h.
+
 Analogamente, se dovete calcolare la dimensione di un qualche campo di una
 struttura, usate
 
@@ -1084,10 +1086,11 @@ struttura, usate
 
 	#define sizeof_field(t, f) (sizeof(((t*)0)->f))
 
-Ci sono anche le macro min() e max() che, se vi serve, effettuano un controllo
-rigido sui tipi.  Sentitevi liberi di leggere attentamente questo file
-d'intestazione per scoprire cos'altro è stato definito che non dovreste
-reinventare nel vostro codice.
+definita in stddef.h.
+
+Ci sono anche le macro min() e max() definite in minmax.h che effettuano un
+controllo rigoroso sui tipi. È consigliato consultare i vari file header per
+vedere altre macro già disponibili.
 
 19) Linee di configurazione degli editor e altre schifezze
 -----------------------------------------------------------
-- 
2.51.0

