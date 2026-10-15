Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1211A5158A8
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064072; cv=none; b=csEoxQpPgB2PDSEBhmLzSrml8j8FK/a1OuLQs/PDsibvffsb2MJv42neXPBtYbP+Rss+zbTMpxjbgxsiZEcEJSlVT68la8uQpUhpzh9mirrI9XfcfL5RBQASXdq01N4C45p/SjxpU4shCZt5S0krey94ca8F/Xw6fpD0BRPaLlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064072; c=relaxed/simple;
	bh=XOFaTVSwW/9YBFC6mfw/z7wVwnNezmfJy/wesJmf7IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WLFA3Tef+85K8PBAL++GAR7vIQxDKbxVYpyXafeIcJvZ8ywpqas3xuiO+wch/PidNYHzeofO/0ID6Bjw2XinhhOYp8ByhWiA2ygvcoGcxpn39cM8RwoolMn/0P98B7ofSvmOEW0vNBeIYOGLVyZX8EQ2LGGz0X2GgHFJx86evNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qC1SzCgD; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qC1SzCgD"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5959691eec.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 04:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792064065; x=1792668865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+kuxUp68NfE1BX6EejbUySHt6ovgmEbDuypLUDZaOH4=;
        b=qC1SzCgD0r8vgvS1/Kc+FEVv/AczDSyiFv5ZGa0n18h2rTQfYz85sqAozwYAbnSXgN
         dI5HlfaIk6V2AJtXTGd7sGRIJNyJh8x9HCxDeVcdcvlRF0G4OxMBLcGp9XTX0AmQTbnp
         M39iIeEZwV1PhCsKEtohsY0SO0KesC9elPiFoj9zUoiSRMrxnX9VUeJYO/R2VRd1UDrb
         xzclGuI6DC9c0httjnP7c93SXy0t2jHnUR7etEi40+ZcU1J5ekSagu6gG84maCr6/Xuu
         8GS+vYo8kYm+93OuySY3InyDZ6fdBBvJfrfNGcOQRQQOTdAiAHp+tQr9SEaw+ija9lW4
         rVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064065; x=1792668865;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kuxUp68NfE1BX6EejbUySHt6ovgmEbDuypLUDZaOH4=;
        b=mFrDPJ7eM1KXGaEuHwADi+eRo7VSiV/pMExAPyK0PV8k8USwFtWCfmJojqx6xqLxN+
         JsqFk8Njw3ZnYcCAjO2ZqpWnCKVDjFNz8YXNcFm08Z9Jo3e/QQ0EPiTDZ6jjQd4HGyr7
         i05wfNfP90C9TcbRiEWzbF9iAIXBNqi7Nc43IzmxqKcHielPV34Sx+Y6B/mf/7BN9Rk+
         KdDoRx3erHOTfJW3LACI+VUlIB4KVrV4sE0nNy5iLIlAUXbgcQZYuvXAqi22eRWAFuiF
         j7/FiqGjFe8xHFL6H1QYgqqsfuON2tJRnT/GkbaSUUHhoOoMCAh5gJmBj5vMiTHN8bnd
         1AQg==
X-Gm-Message-State: AFq9FYI2zhU9KV8XAbPIfujYqNIyx/ORWyqHg/CftRwsLjaRkCBrKh9G
	XkKlQZ6NimLGQk2z8R2grgvyDpcbi0AMawwGQz5rlLf4eRbQf3WQnaU/celRebop
X-Gm-Gg: AYBFou3CweS7weVUuQap3sNAfAqGCHbR+vLJzTJW/vooj9pSN1lS9gzsqBXSu39pTz1
	Ycy/49/cuEGQGhgiqS9+jxQVjDrRyTUV+v2ryyoB8cK8IDMep3MlwR+aOqwTdqfzXGaLBI2WLdN
	p06hs+C+EkFWDCtlRZttdGRnYpovhMjsc0EEkzsZLywb5ZGY4BMYJUPYmdkgtcn389JRwcnKm4o
	vmPiwOEw4/d9kYyy+AkxUohIxR7Ky0+hI1sgnX7GX3ePSYnCf/tdIloGHIYAZ4db/yZ4M59x9/V
	yZgeoQPsT4IaCfhCHXh9hfq6poits6k3UG+L/hBPifHzygex/paB2PQ+kPOxiwqXVGkP4IgkADs
	jD+Ck8RUu1oQTeTm6YZrSHvJXlmu905hJKWPqh7uURiwSRy++DtPq7zHv7EgOowvMMyFUAkH9L3
	Bp72Y5MVY5eUB+CP3uQtxDgLDr1YTjgvrM1SOFzXUGZaZd/TY9PxqUb/gbL9CbXBTFZ6ga1Kdp8
	bdkZ/JQRYjpJB/1zGjyJgB4d/B67/FcnxXHxE1yBAoRBtuQwTmfs3LEjH9Q3t7zugn3Qp8+TWR6
	5eBUhEBLHxJbrv6glDoIYfo=
X-Received: by 2002:a05:7300:8803:b0:351:735e:2ef8 with SMTP id 5a478bee46e88-3537df50e9dmr29151243eec.7.1792064064381;
        Thu, 15 Oct 2026 04:34:24 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm69156913eec.3.2026.10.15.04.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:34:24 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2 04/10] docs/translations/pt_BR: admin-guide: add cputopology.rst
Date: Thu, 15 Oct 2026 08:31:12 -0300
Message-ID: <20261015113121.4550-5-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015113121.4550-1-danielmaraboo@gmail.com>
References: <20261015113121.4550-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add translation of cputopology.rst to Portuguese and update
admin-guide/index.rst.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/admin-guide/cputopology.rst         | 105 ++++++++++++++++++
 .../translations/pt_BR/admin-guide/index.rst  |   2 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/cputopology.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/cputopology.rst b/Documentation/translations/pt_BR/admin-guide/cputopology.rst
new file mode 100644
index 000000000..f7321e275
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/cputopology.rst
@@ -0,0 +1,105 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================================================================
+Como as informações de topologia de CPU são exportadas via sysfs
+================================================================
+
+As informações de topologia de CPU são exportadas via sysfs. Os itens
+(atributos) são semelhantes à saída de /proc/cpuinfo em algumas arquiteturas.
+Eles residem em /sys/devices/system/cpu/cpuX/topology/. Por favor, consulte o
+arquivo de ABI: Documentation/ABI/stable/sysfs-devices-system-cpu.
+
+O arquivo independente de arquitetura, drivers/base/topology.c, exporta esses
+atributos. No entanto, os arquivos do sysfs relacionados à hierarquia de die,
+cluster, book e drawer só serão criados se uma arquitetura fornecer as macros
+relacionadas, conforme descrito abaixo.
+
+Para que uma arquitetura ofereça suporte a esse recurso, ela deve definir
+algumas dessas macros em include/asm-XXX/topology.h::
+
+	#define topology_physical_package_id(cpu)
+	#define topology_die_id(cpu)
+	#define topology_cluster_id(cpu)
+	#define topology_core_id(cpu)
+	#define topology_book_id(cpu)
+	#define topology_drawer_id(cpu)
+	#define topology_sibling_cpumask(cpu)
+	#define topology_core_cpumask(cpu)
+	#define topology_cluster_cpumask(cpu)
+	#define topology_die_cpumask(cpu)
+	#define topology_book_cpumask(cpu)
+	#define topology_drawer_cpumask(cpu)
+
+O tipo das ``macros **_id`` é int.
+O tipo das ``macros **_cpumask`` é ``(const) struct cpumask *``. Estas últimas
+correspondem aos atributos apropriados ``**_siblings`` do sysfs (exceto por
+topology_sibling_cpumask(), que corresponde a thread_siblings).
+
+Para manter a consistência em todas as arquiteturas, include/linux/topology.h
+fornece definições padrão para qualquer uma das macros acima que não estejam
+definidas em include/asm-XXX/topology.h:
+
+1) topology_physical_package_id: -1
+2) topology_die_id: -1
+3) topology_cluster_id: -1
+4) topology_core_id: 0
+5) topology_book_id: -1
+6) topology_drawer_id: -1
+7) topology_sibling_cpumask: apenas a CPU fornecida
+8) topology_core_cpumask: apenas a CPU fornecida
+9) topology_cluster_cpumask: apenas a CPU fornecida
+10) topology_die_cpumask: apenas a CPU fornecida
+11) topology_book_cpumask: apenas a CPU fornecida
+12) topology_drawer_cpumask: apenas a CPU fornecida
+
+Além disso, as informações de topologia de CPU são fornecidas sob
+/sys/devices/system/cpu e incluem estes arquivos. A fonte interna para a saída
+está entre colchetes ("[]").
+
+    =========== ==========================================================
+    kernel_max: o índice máximo de CPU permitido pela configuração do kernel.
+		[NR_CPUS-1]
+
+    offline:	CPUs que não estão online porque foram desligadas via
+		HOTPLUG ou excedem o limite de CPUs permitido pela
+		configuração do kernel (kernel_max acima).
+		[~cpu_online_mask + cpus >= NR_CPUS]
+
+    online:	CPUs que estão online e sendo escalonadas [cpu_online_mask]
+
+    possible:	CPUs para as quais foram alocados recursos e que podem ser
+		colocadas online se estiverem presentes. [cpu_possible_mask]
+
+    present:	CPUs que foram identificadas como presentes no
+		sistema. [cpu_present_mask]
+    =========== ==========================================================
+
+O formato para a saída acima é compatível com cpulist_parse()
+[veja <linux/cpumask.h>]. Alguns exemplos a seguir.
+
+Neste exemplo, existem 64 CPUs no sistema, mas as cpus 32-63 excedem
+o máximo do kernel, que está limitado a 0..31 devido à opção de
+configuração NR_CPUS ser 32. Observe também que as CPUs 2 e 4-31 não estão
+online, mas poderiam ser colocadas online, pois estão tanto presentes
+quanto possíveis::
+
+     kernel_max: 31
+        offline: 2,4-31,32-63
+         online: 0-1,3
+       possible: 0-31
+        present: 0-31
+
+Neste exemplo, a opção de configuração NR_CPUS é 128, mas o kernel foi
+iniciado com possible_cpus=144. Existem 4 CPUs no sistema e a cpu2
+foi colocada offline manualmente (e é a única CPU que pode ser colocada
+online.)::
+
+     kernel_max: 127
+        offline: 2,4-127,128-143
+         online: 0-1,3
+       possible: 0-127
+        present: 0-3
+
+Consulte Documentation/core-api/cpu_hotplug.rst para o parâmetro de inicialização
+do kernel possible_cpus=NUM, bem como para obter mais informações sobre as
+várias cpumasks.
diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index 878a88d71..c574515c2 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -37,10 +37,10 @@ com eles.
 
    sysfs-rules
    sysctl/index
+   cputopology
 
 Todolist:
 
-*   cputopology
 *   abi
 
 Documentação relacionada à segurança:
-- 
2.47.3

