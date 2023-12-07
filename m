Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEF610F7;
	Thu,  7 Dec 2023 06:30:59 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id EE40C24E260;
	Thu,  7 Dec 2023 22:30:53 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 7 Dec
 2023 22:30:53 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 7 Dec
 2023 22:30:47 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Dan Williams <dan.j.williams@intel.com>, "Ilkka
 Koskinen" <ilkka@os.amperecomputing.com>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Ley Foon Tan
	<leyfoon.tan@starfivetech.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v5 3/3] docs: perf: Add description for StarFive's StarLink PMU
Date: Thu, 7 Dec 2023 22:29:40 +0800
Message-ID: <20231207142940.1794032-4-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207142940.1794032-1-jisheng.teoh@starfivetech.com>
References: <20231207142940.1794032-1-jisheng.teoh@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

StarFive StarLink PMU support monitoring L3 memory system PMU events.
Add documentation to describe StarFive StarLink PMU support and it's
usage.

Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
---
 Documentation/admin-guide/perf/index.rst      |  1 +
 .../perf/starfive_starlink_pmu.rst            | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/starfive_starlink_pmu.=
rst

diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/adm=
in-guide/perf/index.rst
index a2e6f2c81146..c5de7579a71b 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -13,6 +13,7 @@ Performance monitor support
    imx-ddr
    qcom_l2_pmu
    qcom_l3_pmu
+   starfive_starlink_pmu
    arm-ccn
    arm-cmn
    xgene-pmu
diff --git a/Documentation/admin-guide/perf/starfive_starlink_pmu.rst b/D=
ocumentation/admin-guide/perf/starfive_starlink_pmu.rst
new file mode 100644
index 000000000000..2932ddb4eb76
--- /dev/null
+++ b/Documentation/admin-guide/perf/starfive_starlink_pmu.rst
@@ -0,0 +1,46 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+StarFive StarLink Performance Monitor Unit (PMU)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+StarFive StarLink Performance Monitor Unit (PMU) exists within the
+StarLink Coherent Network on Chip (CNoC) that connects multiple CPU
+clusters with an L3 memory system.
+
+The uncore PMU supports overflow interrupt, up to 16 programmable 64bit
+event counters, and an independent 64bit cycle counter.
+The PMU can only be accessed via Memory Mapped I/O and are common to the
+cores connected to the same PMU.
+
+Driver exposes supported PMU events in sysfs "events" directory under::
+
+  /sys/bus/event_source/devices/starfive_starlink_pmu/events/
+
+Driver exposes cpu used to handle PMU events in sysfs "cpumask" director=
y
+under::
+
+  /sys/bus/event_source/devices/starfive_starlink_pmu/cpumask/
+
+Driver describes the format of config (event ID) in sysfs "format" direc=
tory
+under::
+
+  /sys/bus/event_source/devices/starfive_starlink_pmu/format/
+
+Example of perf usage::
+
+	$ perf list
+
+	starfive_starlink_pmu/cycles/                      [Kernel PMU event]
+	starfive_starlink_pmu/read_hit/                    [Kernel PMU event]
+	starfive_starlink_pmu/read_miss/                   [Kernel PMU event]
+	starfive_starlink_pmu/read_request/                [Kernel PMU event]
+	starfive_starlink_pmu/release_request/             [Kernel PMU event]
+	starfive_starlink_pmu/write_hit/                   [Kernel PMU event]
+	starfive_starlink_pmu/write_miss/                  [Kernel PMU event]
+	starfive_starlink_pmu/write_request/               [Kernel PMU event]
+	starfive_starlink_pmu/writeback/                   [Kernel PMU event]
+
+
+	$ perf stat -a -e /starfive_starlink_pmu/cycles/ sleep 1
+
+Sampling is not supported. As a result, "perf record" is not supported.
+Attaching to a task is not supported, only system-wide counting is suppo=
rted.
--=20
2.25.1

