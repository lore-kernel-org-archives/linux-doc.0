Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848567;
	b=GU/B1lOUq+lcXYXYGBbPzM1dXykkYXCtaldcUSEFGiUR3oGQvO+7/hgbE83Fl+ivCcF+
	 uf3NvcXRRvcVEhSC7D4BOFOXeK4URICLdf01xxJZFoikPdTr+YPybYjVPrupcNAHHYFDZ
	 /XsoD2gnuM0eK0psc2xR70AmSndxTsczJMMJ+fYqCq8u65Br4EAoyrRrb4bi76BgE2eTx
	 VRhddRnBHGycHfDrd/+dS2Yj5aLCjwrDIJ9GcAii+s7C7QFZm0gDznoCaFjnkKJah37Yp
	 R1HjfsE6asKArysSQGU8KzHCwSOLOZYY8s5Q3JFOwHv2jyrJpYwD46/UHGDclxRDo3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848567;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=b8+uPxafMeUS03eitRn/odooyyeVux3GoXn7biXC5uQ=;
	b=BTfJDSr9retO5mDPzk84+PP7STHNXunydV9RFn+2u+22wBSGrR1Vy+/vKxepQwgTEuD2
	 T/XCAKXbpXZjoMHaJpkhYbM6et6JRaPxBSGSFfz1Lx3k/O+8K+Dz8POd6mcNObfu4blpE
	 0f2cZMWxJSWmq64NCV6XY9jtf9xUZLJmZ42upa7phsz+GFTzIDE0oBmk8kElaudQPRpwT
	 sDc71/dB7nEXn3f1umFMwjL4hh9HaiknHRZtPZ4qK5mO0WUB5MQnTYcLEaoG1HVRRyvEe
	 z2cs8wTnNy+EY8Vs/67MSzq8pN9cb9AI0wvR717qC8ypo9b0ISaoc9pmeDAGaGyRWgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF73C606A31E;
	Sat, 28 Nov 2026 06:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF73C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMC2_c5veQprXm0hAA--.61682S2;
	Sat, 28 Nov 2026 14:49:19 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAnsjxseQprphd_AA--.15110S2;
	Sat, 28 Nov 2026 14:49:17 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijie Yuan <wy@wyuan.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9] docs/zh_CN: align translation paths and update guides
Date: Sat, 28 Nov 2026 14:49:07 +0800
Message-ID: <20261128064916.3481435-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMC2_c5veQprXm0hAA--.61682S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvPXoW5ArWUtw43Jw4xXFyktw1Dp5X_AF1UAoZxKw
	45uwsrCF17JF4kGr48Ar17JFsxCrZYqw45Aryqg34Yg3W0gw1rXw15A39093y5C3srXry8
	Ww4rJFZ5A3Wrn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3AaLa
	J3UjIYCTnIWjp_UUUOL7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
	87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r126r
	1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xv
	s2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxVWxJV
	W8Jr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bbpBfUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Several Chinese translations are no longer at the same relative paths as
their English originals, and some Original fields are stale. This series
moves the translations to matching paths, adjusts their indexes, and
removes stale Original fields. It also updates selected translations to
newer English commits.

v3->v4:
- Rebase onto docs-next and retain the translated process/changes.rst
  in the reorganized process index.
- Add Yanteng Si's Reviewed-by tag to all nine patches.

v2->v3:
- Remove unused top-level labels from the translated V4L driver index,
  process index, and magic-number guide.
- Update the zh_TW admin-guide README reference to the relocated zh_CN
  GDB debugging guide.

v1->v2:
- Drop the unused top-level readme_zh label from the translated
  admin-guide README.

Dongliang Mu (9):
  docs/zh_CN: update admin-guide/index.rst translation
  docs/zh_CN: update admin-guide/README.rst translation
  docs/zh_CN: add media administrator guide translations
  docs/zh_CN: reorganize process debugging guides
  docs/zh_CN: update magic-number to match upstream
  docs/zh_CN: reorganize media driver API translations
  docs/zh_CN: move GFS2 translations into filesystems/gfs2
  docs/zh_CN: update networking/xfrm/xfrm_proc.rst translation
  docs/zh_CN: remove stale Original fields from SCSI and IPE
    translations

 .../translations/zh_CN/admin-guide/README.rst |  87 +-
 .../translations/zh_CN/admin-guide/index.rst  |  12 +-
 .../zh_CN/admin-guide/media/index.rst         |  54 +
 .../zh_CN/admin-guide/media/omap3isp.rst      |  95 ++
 .../zh_CN/admin-guide/media/v4l-drivers.rst   |  42 +
 .../translations/zh_CN/dev-tools/index.rst    |  37 +-
 .../translations/zh_CN/driver-api/index.rst   | 232 +++--
 .../zh_CN/driver-api/media/index.rst          |  52 +
 .../zh_CN/driver-api/media/v4l2-core.rst      |  36 +
 .../zh_CN/driver-api/media/v4l2-dev.rst       | 286 ++++++
 .../zh_CN/driver-api/media/v4l2-device.rst    | 127 +++
 .../zh_CN/driver-api/media/v4l2-event.rst     | 124 +++
 .../zh_CN/driver-api/media/v4l2-fh.rst        | 123 +++
 .../zh_CN/driver-api/media/v4l2-intro.rst     |  75 ++
 .../zh_CN/driver-api/media/v4l2-subdev.rst    | 491 +++++++++
 .../{gfs2-glocks.rst => gfs2/glocks.rst}      |   4 +-
 .../filesystems/{gfs2.rst => gfs2/index.rst}  |  18 +-
 .../{gfs2-uevents.rst => gfs2/uevents.rst}    |   4 +-
 .../translations/zh_CN/filesystems/index.rst  | 112 +-
 .../translations/zh_CN/networking/index.rst   | 238 +++--
 .../zh_CN/networking/xfrm/index.rst           |  20 +
 .../zh_CN/networking/{ => xfrm}/xfrm_proc.rst |   4 +-
 .../zh_CN/process/applying-patches.rst        |   2 +
 .../debugging}/gdb-kernel-debugging.rst       |  15 +-
 .../zh_CN/process/debugging/index.rst         |  62 ++
 .../translations/zh_CN/process/index.rst      | 109 +-
 .../translations/zh_CN/scsi/wd719x.rst        |   2 -
 .../translations/zh_CN/security/ipe.rst       |   2 -
 .../translations/zh_CN/staging/index.rst      |   6 +-
 .../{process => staging}/magic-number.rst     |  33 +-
 .../zh_CN/video4linux/omap3isp.txt            | 277 -----
 .../zh_CN/video4linux/v4l2-framework.txt      | 958 ------------------
 .../translations/zh_TW/admin-guide/README.rst |   2 +-
 33 files changed, 2127 insertions(+), 1614 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/media/index.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/media/omap3isp.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/media/v4l-drivers.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/index.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-core.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-dev.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-device.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-event.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-fh.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-intro.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-subdev.rst
 rename Documentation/translations/zh_CN/filesystems/{gfs2-glocks.rst => gfs2/glocks.rst} (99%)
 rename Documentation/translations/zh_CN/filesystems/{gfs2.rst => gfs2/index.rst} (93%)
 rename Documentation/translations/zh_CN/filesystems/{gfs2-uevents.rst => gfs2/uevents.rst} (97%)
 create mode 100644 Documentation/translations/zh_CN/networking/xfrm/index.rst
 rename Documentation/translations/zh_CN/networking/{ => xfrm}/xfrm_proc.rst (96%)
 rename Documentation/translations/zh_CN/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (93%)
 create mode 100644 Documentation/translations/zh_CN/process/debugging/index.rst
 rename Documentation/translations/zh_CN/{process => staging}/magic-number.rst (58%)
 delete mode 100644 Documentation/translations/zh_CN/video4linux/omap3isp.txt
 delete mode 100644 Documentation/translations/zh_CN/video4linux/v4l2-framework.txt

-- 
2.51.0

