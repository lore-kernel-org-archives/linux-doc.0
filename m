Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954985;
	b=2Em+uotyqxM+6Fn43ouHPyVDL43Y9F7e9dbtsIDEkfiD4fclRuUxTwJdY0/MqkyuQQf0
	 jCLKbnAJKyXmCDWiu6yjs5Oo71OM159XEJCp9RBhzfHUp+mqYeXdvjrJUGHDU5mOsh8ae
	 bIdVtEbS4cGtLFg2IA/8JMZp4wq/e9pyIcvmUaBr/kWfvjTCM/0C37aVC8dsfxRsuoWIh
	 Lo2s5rUZNFLn1Bh+ACTsOprnUF9enaCCFA1GJK2kb2nqktq4qSfM+kT8dA327QOziCLTa
	 dYJkqkQ7lNwWaAGP6fXUHMzp45EoJzGKf4D/frXjOf6NGKT8aafJvNQSKaWhOjwszoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Z2EvmeuWVweg+6QWuz9lHs8aPNlPx3bx/ZhKvecgZoY=;
	b=bSWsKyOZwN2MoA5GyzfMx5FVQz6nUsiEjqoLKqCHRZF1VHAvcObueLd0BoG0C9Rpyz2x
	 eCp18HjoRWb61s5GPrRO1+STpsifod7UJc4J4SJeIRYs/ZBjzbgUlOLdZRHTgTw2UtQHt
	 AqqjRP0A0hIVxg4qAW9N5smLcrrPvFCQkLQgye7k/8WOOOiaVflUpaJ3Zkdb7bHvlagys
	 ShBXwYaFVq1TQ4hyK+THKNAQKgoVtzOQNX/CzXNEVP10pt2QZoXkMT2xeHc9qGOa5uzMZ
	 9/K8aupOG150Wi7luncvROG79pXCEtbncr5kGV01Y8dkoch79mRp7SC0WyaFWpIWTng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJo1A7rZ;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EDA606A31C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3EDA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJo1A7rZ
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67dae7d3f7dso271182d50.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794954984; x=1795559784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z2EvmeuWVweg+6QWuz9lHs8aPNlPx3bx/ZhKvecgZoY=;
        b=rJo1A7rZOAD+6CKVfYPxNHurCZ+uHuVbNf3hy2kzqOfz8ZMKZZh5UOrfMeC8mpvqaP
         olhaFabZmiyjg1N7evVzmIdRoNOigAaiy7bAQ0QAy8B6KhPzHavk8CIutz+AVFSfrMob
         Lr0rg4QtEpwqJaOvqGm2dzMWE4GFg41lTowNmiUhGB/DBmNpifbmWJaqrECuIlVVr8kH
         lFs2Nz5l9OJgNr49unL4dC52ZEDh4zTgve0r+H4TE5tTzPvli3hx5v8kdkf2LUyp84Fs
         4YwVcbCG0lmD2HNqcCdBKPjiig2KUE+Uhbst8il1dQtIywXhNzFLdWHzPQiZ0HtRE6VA
         BlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954984; x=1795559784;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2EvmeuWVweg+6QWuz9lHs8aPNlPx3bx/ZhKvecgZoY=;
        b=TUvoyURZF8S0TO3OCf0CUyHm8uKkf3slnYg30lx+kIFa1U+ls5ImnaasXX9GaWw2D/
         EH7W2DEG5W/jsRL52/VErzZxnFcwaBa5Shv0Z5nLzki3z4MpN/RGxVjDTGBUU+NTv05e
         AdjCUR4M0lQlmGPjrLaEplpdbnkWSzlzW6ldgK2UhLzzPCt+JwqASRyTxQMUuU8c/ihy
         Vj/eVCHjldw/IEXjcsC6jV7WJG9ne7xd6OH149JTANLfnhcni9oTYZaTmZfYurkrmOfa
         hxuJbuCYmCni6hXSnbE2CISze9PsH+Ulshpy6vx4LQtyUkNUR3AlL2CKb6wOwQFpmWVB
         BD2A==
X-Forwarded-Encrypted: i=1; AL+hErGfS/jjTubArQntDVp1T6egTv0FRozXWjBxzpdilR5cTiTrq2dCgS87oYEzQFqXJAjiOpIKKJHoOeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8q2Kk1idNFwdnluYhslZL945uTvDk82ckmWkUw16VekKFopq5
	PA8fLIJ9I4XG79MitK9Jxc/tjc/WCP+StRCNXhQ78xjDzG0Ix0ywNecIu1ZZZi/Pr3Q=
X-Gm-Gg: AZFdTZcL6fXfP4bbxj0OPHBRBQwdoNzr4oWBnqd6/u+w6rNHTODIXUMV8tiReAdo4V8
	tC7Tt32O0RvvTLe9VKGafbUycn6i1YkI2+hdDAwf6fuDJUZA5eI46yHp4qO2kF7Ohg6m7JIvDYz
	/a6rKIHYXkX/cVwmYwQVhji2Uk+pBxTCccz9D6o0cJIf2eXCdYosEx5TxL6uBaCUZZlB/tT+Av0
	tZs8Fe/5c06MjXQfHuZmIDJ/mCUbEH0pn+l/1IZdSQjzC+vaArgU8fj1ZGnbyIlcHM5lwrhqb4P
	wlX3J2zGpgXLSiSWHM4GZPFfqQxv1sIY2hw4ve4RugFnw0RQoFFkWl8gXBYMDETm9Aa2/6lhvB8
	8EXCqjwQQpD1ReY1De+/B7DUlJDDSfJgfuUHrD8sI8Z595eA1TB1lztkmbgPOKoQTafuv6Ui+VI
	G4ZSt7UB16qPNtQCj8rPFMWCdX+0/xTN6zm9ETNwQUus2vt4T7qE755WcyWNZ2jHdMJV5rXtLkI
	noqa4FElog4oDLlAsVbIYqivCa2HAAcxCOJI5Z1YbMbeAOfmpt3ce7VHHZWiik/LVw3siMOLSd3
	Q3vZJpMnIXG9uadRJ8/PLSQZb+wVGg0tDIkhCidCyYNePSj6CQNJGvi1CeBrLmy4q0Ypb8KBntx
	lAUBbnberI6/sf4m7a5aOVWNyeDiqnulqX5Bfz/HQDjNCduGj2K1nO+RDQ05IqDHzl/xSlA==
X-Received: by 2002:a05:690e:450d:10b0:67c:1c64:45f6 with SMTP id 956f58d0204a3-67dd3f82b60mr268258d50.67.1794954983911;
        Tue, 17 Nov 2026 14:36:23 -0800 (PST)
Received: from nixos ([2804:14c:a8:965f:9b81:8c7f:a117:6ada])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd5865e39sm493253d50.10.2026.11.17.14.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:36:23 -0800 (PST)
From: Igor Giamoniano <igorgphotoarte@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Igor Giamoniano <igorgphotoarte@gmail.com>
Subject: [PATCH v1 2/2] docs: pt_BR: process: debugging: point references to translated driver guide
Date: Tue, 17 Nov 2026 19:33:35 -0300
Message-ID: <20261117223335.111220-2-igorgphotoarte@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117223335.111220-1-igorgphotoarte@gmail.com>
References: <20261117223335.111220-1-igorgphotoarte@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that the driver development debugging guide has a pt_BR
translation, update the references in the pt_BR debugging index and
in the userspace debugging guide so they point to the translated
document instead of the English original.

Signed-off-by: Igor Giamoniano <igorgphotoarte@gmail.com>
---
 Documentation/translations/pt_BR/process/debugging/index.rst  | 2 +-
 .../pt_BR/process/debugging/userspace_debugging_guide.rst     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/debugging/index.rst b/Documentation/translations/pt_BR/process/debugging/index.rst
index db083a501d1..89a7770b11d 100644
--- a/Documentation/translations/pt_BR/process/debugging/index.rst
+++ b/Documentation/translations/pt_BR/process/debugging/index.rst
@@ -57,7 +57,7 @@ kernel?
 
 Nesse caso, sua gama de ferramentas disponíveis é muito maior. Você
 pode encontrar as ferramentas
-no :doc:`/process/debugging/driver_development_debugging_guide`.
+no :doc:`driver_development_debugging_guide`.
 
 A temporização é um fator?
 --------------------------
diff --git a/Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst b/Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst
index 8c161921347..44f1b048cca 100644
--- a/Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst
+++ b/Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst
@@ -7,7 +7,7 @@ Conselhos de depuração a partir do espaço de usuário
 Este documento fornece uma breve visão geral das ferramentas mais comuns
 para depurar o kernel Linux a partir do espaço de usuário.
 Para conselhos de depuração voltados a desenvolvedores de drivers, veja
-:doc:`aqui </process/debugging/driver_development_debugging_guide>`.
+:doc:`aqui <driver_development_debugging_guide>`.
 Para conselhos gerais de depuração, veja o :doc:`documento de conselhos
 gerais <index>`.
 
@@ -95,7 +95,7 @@ Para a documentação completa do Ftrace, veja :doc:`/trace/ftrace`
 Você também pode rastrear eventos específicos :ref:`usando o rastreamento
 de eventos <trace/events:2. using event tracing>`, que pode ser definido
 conforme descrito aqui: :ref:`Criando um tracepoint customizado do Ftrace
-<process/debugging/driver_development_debugging_guide:ftrace>`.
+<translations/pt_BR/process/debugging/driver_development_debugging_guide:ftrace>`.
 
 Para a documentação completa do rastreamento de eventos do Ftrace, veja
 :doc:`/trace/events`
-- 
2.54.0

